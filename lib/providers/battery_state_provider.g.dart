// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provide BatteryService instance

@ProviderFor(batteryService)
const batteryServiceProvider = BatteryServiceProvider._();

/// Provide BatteryService instance

final class BatteryServiceProvider
    extends $FunctionalProvider<BatteryService, BatteryService, BatteryService>
    with $Provider<BatteryService> {
  /// Provide BatteryService instance
  const BatteryServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'batteryServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$batteryServiceHash();

  @$internal
  @override
  $ProviderElement<BatteryService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BatteryService create(Ref ref) {
    return batteryService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BatteryService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BatteryService>(value),
    );
  }
}

String _$batteryServiceHash() => r'48b8cbb723206bcb1af81aa2dfd6a1afd8e6c47d';

/// Battery state provider

@ProviderFor(BatteryStateNotifier)
const batteryStateProvider = BatteryStateNotifierProvider._();

/// Battery state provider
final class BatteryStateNotifierProvider
    extends $NotifierProvider<BatteryStateNotifier, BatteryState> {
  /// Battery state provider
  const BatteryStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'batteryStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$batteryStateNotifierHash();

  @$internal
  @override
  BatteryStateNotifier create() => BatteryStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BatteryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BatteryState>(value),
    );
  }
}

String _$batteryStateNotifierHash() =>
    r'20a76ee2389d235322d7e17c4aea9c0e6678b6fe';

/// Battery state provider

abstract class _$BatteryStateNotifier extends $Notifier<BatteryState> {
  BatteryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BatteryState, BatteryState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<BatteryState, BatteryState>,
        BatteryState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
