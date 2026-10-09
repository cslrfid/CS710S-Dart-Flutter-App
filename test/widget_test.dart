// Unit tests for pure, hardware-independent logic.
//
// Per CLAUDE.md, the `test/` directory is for unit-testable logic only — RFID
// flows depend on the CS710S BLE platform channels and must be verified on a
// connected reader, so they are intentionally not covered here.

import 'package:flutter_test/flutter_test.dart';

import 'package:cs710sflutterapp/providers/connection_state_provider.dart';

void main() {
  group('ConnectionState', () {
    test('defaults to a disconnected state with no reader or error', () {
      const state = ConnectionState();

      expect(state.status, ConnectionStatus.disconnected);
      expect(state.connectedReader, isNull);
      expect(state.error, isNull);
      expect(state.isConnected, isFalse);
      expect(state.isReady, isFalse);
    });

    test('isConnected is true for both connected and ready states', () {
      expect(
        const ConnectionState(status: ConnectionStatus.connected).isConnected,
        isTrue,
      );
      expect(
        const ConnectionState(status: ConnectionStatus.ready).isConnected,
        isTrue,
      );
      expect(
        const ConnectionState(status: ConnectionStatus.connecting).isConnected,
        isFalse,
      );
    });

    test('isReady is true only for the ready state', () {
      expect(
        const ConnectionState(status: ConnectionStatus.ready).isReady,
        isTrue,
      );
      expect(
        const ConnectionState(status: ConnectionStatus.connected).isReady,
        isFalse,
      );
    });

    test('copyWith overrides only the provided fields', () {
      const state = ConnectionState();

      final updated = state.copyWith(status: ConnectionStatus.initializing);

      expect(updated.status, ConnectionStatus.initializing);
      expect(updated.connectedReader, isNull);
    });

    test('clearError preserves status but drops the error', () {
      const state = ConnectionState(
        status: ConnectionStatus.connecting,
      );

      final cleared = state.clearError();

      expect(cleared.status, ConnectionStatus.connecting);
      expect(cleared.error, isNull);
    });
  });
}
