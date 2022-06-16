import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rent_app/theme/light_theme.dart';

import '../onboard/onboarding_screen.dart';



class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return AnimatedSplashScreen(
        splash: Lottie.asset('assets/lottie-loading.json'), 
         backgroundColor: lightThemeData.dividerColor,
        nextScreen: OnboardingScreen(),
      splashIconSize: 250,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),

      
    );
    
  }
  
  /*return Center(
      child: Column(
        children: [
          RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 20),
                children: [
                  TextSpan(
                      text: '  Alto',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.cyanAccent,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text: 'Rent ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          const Text(
              'Lemon Team',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
          ),
          );
  }*/
}