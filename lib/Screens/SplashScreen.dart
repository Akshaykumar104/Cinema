// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/Widgets/buttom_nav_bar.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), (){
      // ignore: prefer_const_constructors
      Navigator.push(context, MaterialPageRoute(builder: (context) => buttomNavBar(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/splash.json"),

    );
  }
}

