import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'core/di/injection.dart';
import 'features/auth/presentation/bloc/login_bloc.dart';
import 'app/app.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
        () async {
      WidgetsFlutterBinding.ensureInitialized();

      // ✅ Initialize Firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // ✅ Initialize Dependency Injection
      await initDependencies();

      // ✅ Setup Crashlytics error handling
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      // ✅ Start the app with required Bloc providers
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<LoginBloc>()),
          ],
          child: const ExpenseTracker(),
        ),
      );
    },
        (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    },
  );
}
