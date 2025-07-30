import 'dart:async';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'app/set_up_dio.dart';
import 'core/network_executor/error_mapper/default_error_mapper.dart';
import 'core/network_executor/network_executor.dart';
import 'firebase_options.dart';
import 'package:expense_tracker/app/app.dart';

Dio dio = getDioInstance();
NetworkExecutor networkExecutor = NetworkExecutor(
  dio: dio,
  errorMapper: DefaultErrorMapper(onUnauthorized: () {}),
);

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      runApp(const ExpenseTracker());
    },
    (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    },
  );
}
