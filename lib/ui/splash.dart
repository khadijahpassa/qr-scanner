import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // abis 3 detik pindah ke home
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // biar bg nya bg image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_splash.png'),
            fit: BoxFit.fill,
          )
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo_qr_app.png',
            width: 120
          ),
        ),
      ),
    );
  }
}