// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provide RfidChannel instance

@ProviderFor(rfidChannel)
const rfidChannelProvider = RfidChannelProvider._();

/// Provide RfidChannel instance

final class RfidChannelProvider
    extends $FunctionalProvider<RfidChannel, RfidChannel, RfidChannel>
    with $Provider<RfidChannel> {
  /// Provide RfidChannel instance
  const RfidChannelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'rfidChannelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$rfidChannelHash();

  @$internal
  @override
  $ProviderElement<RfidChannel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RfidChannel create(Ref ref) {
    return rfidChannel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RfidChannel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RfidChannel>(value),
    );
  }
}

String _$rfidChannelHash() => r'9a6876724eedac39b1d2da0baacaf4838035fac6';

/// Provide RfidService instance

@ProviderFor(rfidService)
const rfidServiceProvider = RfidServiceProvider._();

/// Provide RfidService instance

final class RfidServiceProvider
    extends $FunctionalProvider<RfidService, RfidService, RfidService>
    with $Provider<RfidService> {
  /// Provide RfidService instance
  const RfidServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'rfidServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$rfidServiceHash();

  @$internal
  @override
  $ProviderElement<RfidService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RfidService create(Ref ref) {
    return rfidService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RfidService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RfidService>(value),
    );
  }
}

String _$rfidServiceHash() => r'a25dba7584d6baa1f3429c9ade996da1c52354c2';

/// Provide ScanService instance

@ProviderFor(scanService)
const scanServiceProvider = ScanServiceProvider._();

/// Provide ScanService instance

final class ScanServiceProvider
    extends $FunctionalProvider<ScanService, ScanService, ScanService>
    with $Provider<ScanService> {
  /// Provide ScanService instance
  const ScanServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'scanServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$scanServiceHash();

  @$internal
  @override
  $ProviderElement<ScanService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ScanService create(Ref ref) {
    return scanService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScanService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScanService>(value),
    );
  }
}

String _$scanServiceHash() => r'4d2e2f38e08542eb3ba9c1ea930f50df0e39d630';

/// Scan state provider

@ProviderFor(ScanStateNotifier)
const scanStateProvider = ScanStateNotifierProvider._();

/// Scan state provider
final class ScanStateNotifierProvider
    extends $NotifierProvider<ScanStateNotifier, ScanState> {
  /// Scan state provider
  const ScanStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'scanStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$scanStateNotifierHash();

  @$internal
  @override
  ScanStateNotifier create() => ScanStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScanState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScanState>(value),
    );
  }
}

String _$scanStateNotifierHash() => r'd529a231c56fb22bae06e9b516d7d02c9fe8c8d7';

/// Scan state provider

abstract class _$ScanStateNotifier extends $Notifier<ScanState> {
  ScanState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ScanState, ScanState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ScanState, ScanState>, ScanState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
