import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  runApp(
    ProviderScope(
      // Riverpod 3.0 retries failing providers by default. This app's
      // providers fold errors into their own state rather than throwing,
      // so auto-retry adds no value and could loop on transient BLE
      // failures — disable it to preserve 2.x behavior.
      retry: (retryCount, error) => null,
      child: const CS710FlutterApp(),
    ),
  );
}
