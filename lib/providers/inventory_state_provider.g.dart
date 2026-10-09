// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provide InventoryService instance

@ProviderFor(inventoryService)
const inventoryServiceProvider = InventoryServiceProvider._();

/// Provide InventoryService instance

final class InventoryServiceProvider extends $FunctionalProvider<
    InventoryService,
    InventoryService,
    InventoryService> with $Provider<InventoryService> {
  /// Provide InventoryService instance
  const InventoryServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'inventoryServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$inventoryServiceHash();

  @$internal
  @override
  $ProviderElement<InventoryService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InventoryService create(Ref ref) {
    return inventoryService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InventoryService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InventoryService>(value),
    );
  }
}

String _$inventoryServiceHash() => r'3382413de76fe976484065794017ff99f402a12e';

/// RFID inventory state provider

@ProviderFor(RfidInventoryStateNotifier)
const rfidInventoryStateProvider = RfidInventoryStateNotifierProvider._();

/// RFID inventory state provider
final class RfidInventoryStateNotifierProvider
    extends $NotifierProvider<RfidInventoryStateNotifier, RfidInventoryState> {
  /// RFID inventory state provider
  const RfidInventoryStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'rfidInventoryStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$rfidInventoryStateNotifierHash();

  @$internal
  @override
  RfidInventoryStateNotifier create() => RfidInventoryStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RfidInventoryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RfidInventoryState>(value),
    );
  }
}

String _$rfidInventoryStateNotifierHash() =>
    r'ea9d74ee2ff8bc0d2c7d1d95e050068b7fe01060';

/// RFID inventory state provider

abstract class _$RfidInventoryStateNotifier
    extends $Notifier<RfidInventoryState> {
  RfidInventoryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RfidInventoryState, RfidInventoryState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<RfidInventoryState, RfidInventoryState>,
        RfidInventoryState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

/// Barcode inventory state provider

@ProviderFor(BarcodeInventoryStateNotifier)
const barcodeInventoryStateProvider = BarcodeInventoryStateNotifierProvider._();

/// Barcode inventory state provider
final class BarcodeInventoryStateNotifierProvider extends $NotifierProvider<
    BarcodeInventoryStateNotifier, BarcodeInventoryState> {
  /// Barcode inventory state provider
  const BarcodeInventoryStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'barcodeInventoryStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$barcodeInventoryStateNotifierHash();

  @$internal
  @override
  BarcodeInventoryStateNotifier create() => BarcodeInventoryStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BarcodeInventoryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BarcodeInventoryState>(value),
    );
  }
}

String _$barcodeInventoryStateNotifierHash() =>
    r'2d5c4c183afa1036d9f6a3c71ed29a57bc014f06';

/// Barcode inventory state provider

abstract class _$BarcodeInventoryStateNotifier
    extends $Notifier<BarcodeInventoryState> {
  BarcodeInventoryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BarcodeInventoryState, BarcodeInventoryState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<BarcodeInventoryState, BarcodeInventoryState>,
        BarcodeInventoryState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
