import 'package:app_ui/home_page.dart';
import 'package:app_ui/intro_screens/intro_page_1.dart';
import 'package:app_ui/intro_screens/intro_page_2.dart';
import 'package:app_ui/intro_screens/intro_page_3.dart';
import 'package:app_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),

        //Dot Indicators
        Container(
          alignment: Alignment(00, 0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              onLastPage ? (
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(1);
                      
                    },

                    child: Text("Back"),
                  )
              ): (
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },

                    child: Text("Skip"),
                  )
              ),

              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: JumpingDotEffect(
                  activeDotColor: Colors.accents.first,
                  dotHeight: 20,
                  dotWidth: 20,
                  verticalOffset: 18,
                ),
              ),
              onLastPage
                  ? (GestureDetector(
                      child: Text("I'm in"),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      },
                    ))
                  : (GestureDetector(
                      child: Text("Next"),
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.easeIn);
                      },
                    )),
            ],
          ),
        ),
      ],
    ));
  }
}
