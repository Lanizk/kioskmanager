import 'package:flutter/material.dart';
import 'package:kiosk_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiosk_app/theme/pallete.dart';
import 'package:kiosk_app/theme/theme_notifier.dart';
 import'package:kiosk_app/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiosk Manager',

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ref.watch(themeNotifierProvider.notifier).mode,

      // Routes
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
