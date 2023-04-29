import 'package:flutter/material.dart';
import 'package:pharmart/Screens/Onboarding/login_or_signup.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

// controller to keeptrack of which page we're on
  final PageController _controller = PageController();

  // check if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [

        //page view to display the different intro pages 
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPage(path: 'assets/images/page1.gif', text: 'GET A QUICK DIAGNOSIS', ),
            IntroPage(path: 'assets/images/page2.gif', text: 'TALK TO A PHARMACIST', ),
            IntroPage(path: 'assets/images/page3.gif', text: 'AND YOUR MEDECINE IS DELIVERED',),
          ],
        ),

        // this is the dot controller and the button to move to the next intro page or go to the get started page
        Container(
          alignment: const Alignment(0,0.7),
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //button to skip 
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: const Text('Skip')),

            // smooth indicator
            SmoothPageIndicator(
              controller: _controller, 
              count: 3,
              onDotClicked: (index) {
                _controller.jumpToPage(index);
              },),

             /**
              * This button shows next or done depending that we are on the last intro page or not
              * When we are on the last intro page the done button leads to the get started page
              */
              onLastPage?
              GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return const LogSign();
                },
                ),
                );
              },
              child: const Text('Done'),
              ) : GestureDetector(
              onTap: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 500), 
                  curve: Curves.easeIn);
              },
              child: const Text('Next'),
              ),
          ],
        ),
          ),
      ],)
    );
  }
}