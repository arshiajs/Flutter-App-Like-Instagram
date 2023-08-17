import 'package:flutter/material.dart';
import 'onboarding.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        return  OnBoardingScreen();
        })));
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/img/background/splash.png', fit: BoxFit.cover,)),
          Center(child: Image.asset('assets/img/background/logo.png', width: 300,),),
          // Text('www.arshiajs.ir'),

        ],
      ),

    );
  }
}
