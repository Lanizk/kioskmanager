import 'package:flutter/material.dart';
import 'package:kiosk_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiosk Manager',
      theme: ThemeData(primarySwatch: Colors.green),
      home:const Scaffold(
        body:Center(child:Text("Firebase Connected")),
      )

    );
  }
}
