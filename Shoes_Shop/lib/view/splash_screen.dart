import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_shop/view/onboardingscreen.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: const Color.fromRGBO(13, 110, 253, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/vector_nike.svg'),
              const Text('NIKE', style: TextStyle(
                  fontSize: 76.0,
                  fontFamily: 'Raceway',
                  color: Colors.white
              ),
              )
            ]
            ,
          )
      ),
    );
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const OnboardingScreen(title: 'abc',)));
  }
  }

