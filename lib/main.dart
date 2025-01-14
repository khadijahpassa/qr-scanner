import 'package:flutter/material.dart';
import 'package:qr_scanner/consts.dart';
import 'package:qr_scanner/ui/home/home_screen.dart';
import 'package:qr_scanner/ui/qr_generator_screen.dart';
import 'package:qr_scanner/ui/qr_scanner_screen.dart';
import 'package:qr_scanner/ui/splash.dart';

void main() {
  runApp(const QrScannerApp());
}

class QrScannerApp extends StatelessWidget {
  const QrScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QR Scanner App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: textColor),
        useMaterial3: true,
        fontFamily: 'SF-Pro-Rounded'
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/home": (context) => const HomeScreen(),
        "/scanner": (context) => const QrScannerScreen(),
        "/generator": (context) => const QrGeneratorScreen(),
      },
    );
  }
}