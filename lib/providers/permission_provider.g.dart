// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$permissionServiceHash() => r'19b92322798ea7fd375e96ef01c7cc2626892ad5';

/// Provider for permission service
///
/// Copied from [permissionService].
@ProviderFor(permissionService)
final permissionServiceProvider =
    AutoDisposeProvider<PermissionService>.internal(
  permissionService,
  name: r'permissionServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$permissionServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PermissionServiceRef = AutoDisposeProviderRef<PermissionService>;
String _$hasPermissionsHash() => r'0b8761530b399f2566f03cb7d3c1c9267a178511';

/// Provider for checking permission status
///
/// Copied from [hasPermissions].
@ProviderFor(hasPermissions)
final hasPermissionsProvider = AutoDisposeFutureProvider<bool>.internal(
  hasPermissions,
  name: r'hasPermissionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasPermissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HasPermissionsRef = AutoDisposeFutureProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
