import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required String title});

  @override
  State<StatefulWidget> createState() => OnboardingState();
}

class OnboardingState extends State<OnboardingScreen> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  final onboardingPageLists = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(20, 131, 194, 1),
          border: Border.all(
            width: 0.0,
            color: const Color.fromRGBO(20, 131, 194, 1),
          ),
        ),

        //controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  child: Row(
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
                ),
                Positioned(
                    top: 120,
                    child: SvgPicture.asset(
                        'assets/images/vector_bottom_text.svg')),
                Positioned(
                    top: 300,
                    child: SvgPicture.asset(
                        'assets/images/vector_nike_after_image.svg')),
                Positioned(
                    child: Image.asset(
                  'assets/images/shoes_onboard1.png',
                )),
                Positioned(
                    top: 420,
                    left: 0,
                    right:80,
                    child: SvgPicture.asset('assets/images/ellipse.svg')),
                Positioned(
                    top: 180,
                    left: 0,
                    right: 100,
                    child: SvgPicture.asset('assets/images/Misc_1.svg')),
                Positioned(
                    top: 480,
                    right: 0,
                    left: 150,
                    child: Transform.rotate(
                      angle: 45,
                      child: SvgPicture.asset('assets/images/highlight_1.svg'),
                    )),
              ],
            ),
            const SizedBox(height: 30,),
            Container(
              margin: const EdgeInsets.only(left: 100,right: 100, bottom: 30),
              child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Get Started')),
                    ),
                  ],
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(20, 131, 194, 1),
          border: Border.all(
            width: 0.0,
            color: const Color.fromRGBO(20, 131, 194, 1),
          ),
        ),
        //controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100,),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 300,
                    child: SvgPicture.asset(
                        'assets/images/vector_nike_after_image.svg')),
                Image.asset('assets/images/shoes_onbroad2.png'),
                Positioned(
                    top: 250,
                    left: 30,
                    child: SvgPicture.asset('assets/images/ellipse.svg')),
                Positioned(
                    top: 150,
                    left: 30,
                    child: SvgPicture.asset('assets/images/Misc_1.svg')),
                Positioned(
                    top: 0,
                    left: 40,
                    child: SvgPicture.asset('assets/images/highlight_1.svg')),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/Highlight_text.svg'),
                const Column(
                  children: [
                    Text(
                      'Let’s Start Journey',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontFamily: 'Raceway',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'With Nike',
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'Smart, Gorgeous & Fashionable',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Raceway',
                          ),
                    ),
                    Text(
                      'Collection Explor Now',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Raceway',
                          ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 100,right: 100, bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Next')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(20, 131, 194, 1),
          border: Border.all(
            width: 0.0,
            color: const Color.fromRGBO(20, 131, 194, 1),
          ),
        ),
        //controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100,),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 300,
                    child: SvgPicture.asset(
                        'assets/images/vector_nike_after_image.svg')),
                Image.asset('assets/images/shoes_onbroard3.png'),
                Positioned(
                    top: 250,
                    left: 30,
                    child: SvgPicture.asset('assets/images/ellipse.svg')),
                Positioned(
                    top: 150,
                    left: 30,
                    child: SvgPicture.asset('assets/images/Misc_1.svg')),
                Positioned(
                    top: 0,
                    left: 40,
                    child: SvgPicture.asset('assets/images/highlight_1.svg')),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/Highlight_text.svg'),
                const Column(
                  children: [
                    Text(
                      'Let’s Start Journey',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontFamily: 'Raceway',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'With Nike',
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'Smart, Gorgeous & Fashionable',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Raceway',
                      ),
                    ),
                    Text(
                      'Collection Explor Now',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Raceway',
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 100,right: 100, bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Next')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        pages: onboardingPageLists,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
      ),
    );
  }
}
