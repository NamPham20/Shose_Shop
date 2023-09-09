import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required String title});

  @override
  State<StatefulWidget> createState() => OnboardingState();
}

class OnboardingState extends State<OnboardingScreen> {
  final onboardingPageLists = [
    PageModel(widget: DecoratedBox(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(20, 131, 194, 1),
        border: Border.all(
          width: 0.0,
          color: const Color.fromRGBO(20, 131, 194, 1),
        ),
      ),
       child: SingleChildScrollView(
  //controller: ScrollController(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/images/Highlight_text.svg'),
              const Column(
                children: [
                  Text(
                    'Wellcome To',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontFamily: 'Raceway',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Nike',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontFamily: 'Raceway',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SvgPicture.asset('assets/images/vector_bottom_text.svg'),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 300,
                  child: SvgPicture.asset(
                      'assets/images/vector_nike_after_image.svg')),
              Positioned(
                  child: Image.asset('assets/images/shoes_onboard1.png')),
              Positioned(
                  top: 420,
                  left: 30,
                  child: SvgPicture.asset('assets/images/ellipse.svg')),
              Positioned(
                  top: 180,
                  left: 30,
                  child: SvgPicture.asset('assets/images/Misc_1.svg')),
              Positioned(
                  top: 480,
                  left: 40,
                  child: SvgPicture.asset('assets/images/highlight_1.svg')),
              Positioned(
                  top: 480,
                  right: 40,
                  child: SvgPicture.asset('assets/images/highlight_1.svg')),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20,),
              Expanded(child:ElevatedButton(onPressed: () {}, child: const Text('Get Started')), ),
              const SizedBox(width: 20,),
            ],
          )
        ],
      ),),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        pages: onboardingPageLists,
      ),
    );
  }
}
