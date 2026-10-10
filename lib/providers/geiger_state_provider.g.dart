// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geiger_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provide GeigerService instance

@ProviderFor(geigerService)
const geigerServiceProvider = GeigerServiceProvider._();

/// Provide GeigerService instance

final class GeigerServiceProvider
    extends $FunctionalProvider<GeigerService, GeigerService, GeigerService>
    with $Provider<GeigerService> {
  /// Provide GeigerService instance
  const GeigerServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'geigerServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$geigerServiceHash();

  @$internal
  @override
  $ProviderElement<GeigerService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GeigerService create(Ref ref) {
    return geigerService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GeigerService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GeigerService>(value),
    );
  }
}

String _$geigerServiceHash() => r'377b206e604db48e7bbfead459c7495c60234eb7';

/// Geiger state provider

@ProviderFor(GeigerStateNotifier)
const geigerStateProvider = GeigerStateNotifierProvider._();

/// Geiger state provider
final class GeigerStateNotifierProvider
    extends $NotifierProvider<GeigerStateNotifier, GeigerState> {
  /// Geiger state provider
  const GeigerStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'geigerStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$geigerStateNotifierHash();

  @$internal
  @override
  GeigerStateNotifier create() => GeigerStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GeigerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GeigerState>(value),
    );
  }
}

String _$geigerStateNotifierHash() =>
    r'6936b1a122e42454676fd96ff306152aea22e283';

/// Geiger state provider

abstract class _$GeigerStateNotifier extends $Notifier<GeigerState> {
  GeigerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GeigerState, GeigerState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<GeigerState, GeigerState>, GeigerState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
