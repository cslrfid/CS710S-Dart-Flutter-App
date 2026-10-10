// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Connection state provider

@ProviderFor(ConnectionStateNotifier)
const connectionStateProvider = ConnectionStateNotifierProvider._();

/// Connection state provider
final class ConnectionStateNotifierProvider
    extends $NotifierProvider<ConnectionStateNotifier, ConnectionState> {
  /// Connection state provider
  const ConnectionStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'connectionStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$connectionStateNotifierHash();

  @$internal
  @override
  ConnectionStateNotifier create() => ConnectionStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectionState>(value),
    );
  }
}

String _$connectionStateNotifierHash() =>
    r'1abeb090d57124a035853ae743600f77c5447d22';

/// Connection state provider

abstract class _$ConnectionStateNotifier extends $Notifier<ConnectionState> {
  ConnectionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ConnectionState, ConnectionState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ConnectionState, ConnectionState>,
        ConnectionState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
