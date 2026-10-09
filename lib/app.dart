import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/main_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/geiger_screen.dart';
import 'utils/theme.dart';

class CS710FlutterApp extends ConsumerWidget {
  const CS710FlutterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'CS710S Quick Start',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      // Riverpod 3.0 pauses providers whose only listeners are on an
      // off-screen route (e.g. a screen sitting under a dialog). This app's
      // providers drive live BLE streams and auto-navigation, so wrap each
      // route in TickerMode(enabled: true) — it overrides the route's own
      // off-screen TickerMode and keeps that screen's providers active,
      // matching Riverpod 2.x behavior.
      routes: {
        '/': (context) =>
            const TickerMode(enabled: true, child: MainScreen()),
        '/scan': (context) =>
            const TickerMode(enabled: true, child: ScanScreen()),
        '/inventory': (context) =>
            const TickerMode(enabled: true, child: InventoryScreen()),
        '/geiger': (context) =>
            const TickerMode(enabled: true, child: GeigerScreen()),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
