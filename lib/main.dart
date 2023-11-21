import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teman_finalproject/sign-up-screen/screen/sign-up-screen.dart';
import 'package:teman_finalproject/splash-screen/screen/splash-screen.dart';
import 'dart:io';

import 'package:teman_finalproject/test.dart';
import 'package:teman_finalproject/wallet/screen/wallet-screen.dart';
import 'package:teman_finalproject/welcome-screen/screen/welcome-screen.dart';

import 'accommodation-screen/screen/accommodation-screen.dart';
import 'assistant-information/screen/assistant-screen.dart';
import 'dashboard/screen/dashboard-screen.dart';
import 'intro-screen/screen/intro-screen.dart';
import 'login/screen/login-screen-new.dart';
import 'login/screen/login-screen.dart';

Future<void> main() async {
  // Ensure the binding is properly initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  List<CameraDescription> cameras = []; // List to store available cameras

  try {
    cameras = await availableCameras(); // Get available cameras
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }

  // Lock screen orientation to portrait mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Bypass SSL certificate verification (for testing purposes only)
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    MyApp(cameras: cameras),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  MyApp({required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.black; // Customize selected radio button color
              }
              return Colors.grey; // Default color for unselected radio buttons
            },
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.black),
        ),
        //  primarySwatch: Colors.blue, // Set the primary color for the app
        buttonColor: Colors.green, // Set the default button color
        textTheme: TextTheme(
          // Define the text styles for the app
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      home: SplashScreen(),
      routes: {
        '/LoginScreen': (context) => LoginScreenNew(), // Pass cameras list to LoginScreen
      //  '/IntroductionScreen': (context) => IntroductionScreen(), //
        '/WelcomeScreen': (context) => WelcomeScreen(), //
        '/SignupScreen': (context) => SignupScreen(), //
        '/DashboardScreen': (context) => DashboardScreen(), //
        '/AssistantScreen': (context) => AssistantScreen(), //
        '/WalletScreen': (context) => WalletScreen(), //
        '/AccommodationScreen': (context) => AccommodationScreen(), //





        // Add more routes if needed
      },
      onGenerateRoute: (settings) {
        // ... your onGenerateRoute logic
      },
    );
  }
}
