import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:project1/loginpage.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.gif(
        backgroundColor: Colors.white,
        gifPath: "asets/giphy.gif",
        gifWidth: 269,
        gifHeight: 474,
        nextScreen: const MyLogin(),
        duration: const Duration(milliseconds: 3515),
        onInit: () async {
          debugPrint("onInit");
        },
        onEnd: () async {
          debugPrint("onEnd 1");
        },
      ),
    );
  }
}
