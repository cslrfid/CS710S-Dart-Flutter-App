# CS710S Flutter App

![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS-blue)
![Language](https://img.shields.io/badge/language-Dart-0175C2?logo=dart)
![License](https://img.shields.io/badge/license-MIT-green)

Flutter application for the **CS710S / CS108** BLE RFID readers. The Dart UI talks to the reader over Bluetooth Low Energy via platform-channel bridges into the native CSL SDKs — `csl-rfid-android-sdk` on Android (pulled from JitPack) and the [`CSL-CS710S`](https://github.com/cslrfid/CSL-CS710S) Swift package on iOS (added as a Swift Package Manager dependency in the Xcode project).

## Architecture

### Layered Design

The app uses a strict five-layer architecture. Each layer only depends on the one below it, which makes the platform channel the single seam between Dart and native code.

```
┌────────────────────────────────────────────────┐
│  UI (screens/, widgets/)                       │  ConsumerWidget — watches providers
└────────────────────────────────────────────────┘
                   ↓ watches
┌────────────────────────────────────────────────┐
│  Riverpod Providers (providers/)               │  @riverpod-generated state holders
└────────────────────────────────────────────────┘
                   ↓ calls
┌────────────────────────────────────────────────┐
│  Services (services/)                          │  business logic, transforms streams
└────────────────────────────────────────────────┘
                   ↓ calls
┌────────────────────────────────────────────────┐
│  RfidChannel (platform_channels/)              │  thin MethodChannel/EventChannel wrapper
└────────────────────────────────────────────────┘
                   ↓ MethodChannel + 8 EventChannels
┌────────────────────────────────────────────────┐
│  Native Bridge                                 │  RfidPlatformChannel.kt  /  .swift
└────────────────────────────────────────────────┘
                   ↓
┌────────────────────────────────────────────────┐
│  Native CSL SDK                                │  com.csl.rfidsdk  /  iOS framework
└────────────────────────────────────────────────┘
```

**State management** is Riverpod with code generation. UI never holds RFID state directly — it watches providers, which delegate to services, which call the platform channel. This means all reader-side events fan out through `Stream`s exposed by the channel wrapper.

**Event model.** Synchronous commands (`startScan`, `connect`, `startInventory`, etc.) flow through one `MethodChannel`. Asynchronous reader events (tag reads, connection state, battery, hardware trigger) flow back through eight broadcast `EventChannel`s, one per concern. Each service subscribes to the relevant streams and re-publishes typed events to its provider.

### Project Structure

```
.
├── lib/
│   ├── main.dart                    # App entry point
│   ├── app.dart                     # MaterialApp configuration
│   ├── platform_channels/
│   │   └── rfid_channel.dart        # Platform channel wrapper
│   ├── services/                    # Business logic layer
│   │   ├── rfid_service.dart        # Core RFID operations
│   │   ├── scan_service.dart        # BLE scanning
│   │   ├── inventory_service.dart   # Inventory management
│   │   ├── geiger_service.dart      # Geiger search
│   │   ├── battery_service.dart     # Battery monitoring
│   │   └── permission_service.dart  # Permissions
│   ├── models/                      # Data models
│   │   ├── rfid_reader.dart
│   │   ├── rfid_tag.dart
│   │   ├── rfid_inventory_stats.dart
│   │   ├── rfid_geiger_stats.dart
│   │   ├── rfid_configuration.dart
│   │   ├── rfid_error.dart
│   │   ├── barcode_data.dart
│   │   ├── barcode_stats.dart
│   │   └── battery_info.dart
│   ├── providers/                   # Riverpod state
│   │   ├── scan_state_provider.dart
│   │   ├── connection_state_provider.dart
│   │   ├── inventory_state_provider.dart
│   │   ├── geiger_state_provider.dart
│   │   ├── battery_state_provider.dart
│   │   └── permission_provider.dart
│   ├── screens/                     # UI screens
│   │   ├── scan_screen.dart         # Reader discovery
│   │   ├── main_screen.dart         # Main navigation
│   │   ├── inventory_screen.dart    # RFID / Barcode
│   │   └── geiger_screen.dart       # Tag location
│   ├── widgets/                     # Reusable widgets
│   │   ├── reader_list_item.dart
│   │   ├── tag_list_item.dart
│   │   ├── connection_status.dart
│   │   ├── battery_indicator.dart
│   │   ├── stats_card.dart
│   │   └── loading_overlay.dart
│   └── utils/                       # Utilities
│       ├── constants.dart
│       ├── formatters.dart
│       └── theme.dart
├── android/
│   └── app/src/main/kotlin/com/csl/cs710flutterapp/
│       ├── MainActivity.kt          # Permissions + bridge wiring
│       └── RfidPlatformChannel.kt   # Native bridge to com.csl.rfidsdk
├── ios/
│   └── Runner/
│       ├── AppDelegate.swift
│       ├── RfidPlugin.swift
│       ├── RfidPlatformChannel.swift
│       └── Models/                  # Swift mirrors of the Dart models
└── pubspec.yaml
```

### Native SDK

| Platform | SDK | How it's pulled in |
|---|---|---|
| Android | `com.csl.rfidsdk` (from [`cslrfid/cs710s-android`](https://jitpack.io/#cslrfid/cs710s-android)) | Gradle dependency: `implementation 'com.github.cslrfid.cs710s-android:csl-rfid-android-sdk:v1.0.0'`. Transitively brings in `cslibrary4a` (BLE/protocol layer) and `epctagcoder` (EPC Gen2 helper). |
| iOS | [`CSL-CS710S`](https://github.com/cslrfid/CSL-CS710S) Swift package | Added as a Swift Package Manager dependency in the Xcode project; the Swift bridge under `ios/Runner/` consumes the package's API. |

The `com.csl.rfidsdk` package layout that the Android bridge code targets:

- `RfidManager` — top-level entry point, created in `MainActivity.onCreate` and released in `onDestroy`.
- `managers/` — feature managers: `RfidConnectionManager`, `RfidInventoryManager`, `RfidGeigerManager`, `RfidConfigurationManager`, `BarcodeScanManager`.
- `callbacks/` — observer interfaces, one per feature.
- `models/` — data types (`RfidReader`, `RfidTag`, `BatteryInfo`, etc.) mirrored on the Dart side under `lib/models/`.

## Platform Channel API

The Dart ↔ native contract is defined by one method channel and eight event channels. Channel names live in three places that must stay in sync: `lib/utils/constants.dart` (Dart), `android/.../RfidPlatformChannel.kt` (Kotlin), and `ios/Runner/RfidPlatformChannel.swift` (Swift).

### MethodChannel: `com.csl.rfid/manager`

#### Device Management
- `startScan()` - Start BLE scanning for readers
- `stopScan()` - Stop BLE scanning
- `isScanning()` - Check if scanning
- `connect(String address)` - Connect to reader
- `disconnect()` - Disconnect from reader
- `isConnected()` - Check connection status

#### RFID Operations
- `startInventory()` - Start RFID tag inventory
- `stopInventory()` - Stop RFID tag inventory
- `startGeigerSearch(String epc, int memoryBank)` - Start Geiger search
- `stopGeigerSearch()` - Stop Geiger search

#### Barcode Operations
- `startBarcodeScan()` - Start barcode scanning
- `stopBarcodeScan()` - Stop barcode scanning

#### Battery & Trigger
- `getBatteryInfo()` - Get current battery level
- `startBatteryMonitoring()` - Start 5-second polling
- `stopBatteryMonitoring()` - Stop battery monitoring
- `enableTrigger(bool autoInventory)` - Enable trigger key
- `disableTrigger()` - Disable trigger key

#### Configuration
- `getConfiguration()` - Get current reader config
- `applyConfiguration(Map config)` - Apply reader settings

### EventChannels (8 streams)

- **`com.csl.rfid/scan_events`** — Reader discovery events
  - `scanStarted`, `scanStopped`, `readerFound`, `scanError`
- **`com.csl.rfid/connection_events`** — Connection status
  - `connecting`, `connected`, `disconnected`, `connectionError`
- **`com.csl.rfid/inventory_events`** — Tag read events
  - `inventoryStarted`, `inventoryStopped`, `tagRead`, `inventoryStats`, `inventoryError`
- **`com.csl.rfid/geiger_events`** — Proximity updates
  - `geigerStarted`, `geigerStopped`, `geigerUpdate`, `geigerError`
- **`com.csl.rfid/barcode_events`** — Barcode scan events
  - `barcodeStarted`, `barcodeStopped`, `barcodeRead`, `barcodeError`
- **`com.csl.rfid/battery_events`** — Battery level updates
  - `batteryUpdate` (every 5 seconds)
- **`com.csl.rfid/trigger_events`** — Trigger button events
  - `triggerPressed`, `triggerReleased`
- **`com.csl.rfid/config_events`** — Configuration results
  - `configApplied`, `configError`

A separate `com.csl.rfid/permissions` method channel handles runtime permission requests; it is wired in `MainActivity.kt`, not in `RfidPlatformChannel.kt`.

## Dependencies

### Production
- **flutter_riverpod** (^2.4.0) — State management with code generation
- **riverpod_annotation** (^2.3.0) — Annotations for Riverpod
- **material_design_icons_flutter** (^7.0.0) — Icon library
- **intl** (^0.18.0) — Internationalization and formatting
- **collection** (^1.18.0) — Collection utilities

### Development
- **build_runner** (^2.4.0) — Code generation
- **riverpod_generator** (^2.3.0) — Riverpod code generation
- **flutter_lints** (^3.0.0) — Linting rules

## Setup

### Prerequisites
- Flutter SDK 3.0.0+
- Android Studio with Flutter plugin (or Xcode for iOS)
- CS710S / CS108 RFID reader hardware
- Android device with Bluetooth (API 26+) or iOS device

### Installation

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Generate Riverpod code**:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

## Features

### 1. Reader Scanning & Connection
- BLE discovery of CS710S / CS108 readers
- Reader list with RSSI signal strength
- Real-time RSSI updates during scanning
- Connection with loading overlay
- Connection state monitoring
- Auto-disconnect on app exit

### 2. RFID Inventory
- Real-time tag reading with accumulation
- Tag list display (EPC, RSSI, read count, timestamp)
- Live statistics: unique tag count, total read count, read rate (tags/second)
- Sort by EPC, RSSI, Count, or Timestamp
- Clear tag list
- Tap a tag to navigate to Geiger search
- Hardware trigger support (press to start, release to stop)
- Battery indicator in statistics card

### 3. Geiger Search (Tag Location)
- Tag locating by EPC
- Real-time proximity gauge (0-100%)
- Visual indicators: percentage display, 5-bar proximity meter, linear progress bar, colour coding (Grey → Yellow → Orange → Green), "Tag Found" indicator
- Proximity descriptions: No Signal / Very Far / Far / Medium / Close / Very Close
- Hardware trigger support
- Battery indicator above search controls
- Auto-reset proximity to zero on search start

### 4. Barcode Scanning
- 1D / 2D barcode support
- Barcode list with timestamps
- Statistics: unique barcode count, total scan count, elapsed time
- Clear barcode list

### 5. Hardware Trigger Key
- Automatic start/stop on trigger press/release
- Works for both RFID inventory and Geiger search
- No manual button press required

### 6. Battery Monitoring
- Automatic monitoring when connected
- 5-second polling interval
- Display format: "Battery: 80%"
- Visual indicator with colour coding (Green ≥60%, Orange 30–59%, Red <30%)
- Battery icon with charging indicator
- Displayed on all screens after connection

### 7. Auto-Configuration
Applied automatically on page load with these defaults:

| Setting | Value |
|---|---|
| Power Level | 30.0 dBm (300) |
| Session | 1 |
| Target | A |
| Inventory Mode | COMPACT |
| Q Value | 7 |
| Beep | Enabled |
| Vibrate | Enabled |

### 8. Error Handling
- Connection errors with retry
- Scan errors with user feedback
- Inventory / Geiger errors surfaced to the UI
- Platform channel error handling
- Graceful disconnect handling

## Usage

### Scanning for Readers
1. Open the app
2. Grant Bluetooth and location permissions
3. Tap **Start Scan** on the scan screen
4. Wait for readers to appear in the list
5. Tap a reader to connect

### RFID Inventory
1. Connect to a reader
2. Navigate to **Inventory** from the main screen
3. Select the **RFID** tab
4. Tap **Start** or press the hardware trigger
5. Tags appear in real time with statistics
6. Tap any tag to locate it in Geiger mode
7. Use the sort menu to organise tags
8. Tap **Stop** or release the trigger when done
9. Tap **Clear** to reset the tag list

### Locating a Tag (Geiger Mode)
1. From inventory, tap a tag, **or** navigate to **Locate Tag** and enter an EPC manually
2. Tap **Start Search** or press the hardware trigger
3. Move the reader closer to / farther from the tag
4. Watch the proximity gauge increase as you get closer
5. "Very Close" (80–100%) indicates the tag is nearby
6. Tap **Stop Search** or release the trigger when done

### Barcode Scanning
1. Connect to a reader
2. Navigate to **Inventory** from the main screen
3. Select the **Barcode** tab
4. Tap **Start**
5. Point the reader at a barcode
6. The barcode appears in the list with a timestamp
7. Tap **Stop** when done
