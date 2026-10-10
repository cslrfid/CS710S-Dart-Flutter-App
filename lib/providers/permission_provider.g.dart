// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for permission service

@ProviderFor(permissionService)
const permissionServiceProvider = PermissionServiceProvider._();

/// Provider for permission service

final class PermissionServiceProvider extends $FunctionalProvider<
    PermissionService,
    PermissionService,
    PermissionService> with $Provider<PermissionService> {
  /// Provider for permission service
  const PermissionServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'permissionServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$permissionServiceHash();

  @$internal
  @override
  $ProviderElement<PermissionService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PermissionService create(Ref ref) {
    return permissionService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PermissionService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PermissionService>(value),
    );
  }
}

String _$permissionServiceHash() => r'8944118369fdc2dd355a221dd4f8a487b7f3372c';

/// Provider for checking permission status

@ProviderFor(hasPermissions)
const hasPermissionsProvider = HasPermissionsProvider._();

/// Provider for checking permission status

final class HasPermissionsProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Provider for checking permission status
  const HasPermissionsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'hasPermissionsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hasPermissionsHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return hasPermissions(ref);
  }
}

String _$hasPermissionsHash() => r'68c2af4bb5e1ab627b60a0d14ed3640f50ec9ff4';
