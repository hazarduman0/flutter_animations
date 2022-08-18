import 'package:animations/controllers/fade_transition_controller.dart';
import 'package:animations/controllers/neumorphism_controller.dart';
import 'package:animations/controllers/size_transition_controller.dart';
import 'package:animations/controllers/slide_transition_controller.dart';
import 'package:animations/screen_animations/fade_transition_page.dart';
import 'package:animations/screen_animations/neumorphism_page.dart';
import 'package:animations/screen_animations/rotation_animation_page.dart';
import 'package:animations/screen_animations/size_transition_page.dart';
import 'package:animations/screen_animations/slide_transition_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final FadeTransitionController _fc = Get.find();
  final SizeTransitionController _sc = Get.find();
  final SlideTransitionController _stc = Get.find();
  final NeumorphismController _nc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: const Icon(Icons.home),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  children: [
                    pageRouteBox(context, 'Fade Transition Page',
                        () => routeToFadeTransitionPage()),
                    pageRouteBox(context, 'Size Transition Page',
                        () => routeToSizeTransitionPage()),
                    pageRouteBox(context, 'Slide Transition Page',
                        () => routeToSlideTransitionPage()),
                    pageRouteBox(
                        context, 'Rotation Page', () => routeToRotationPage()),
                    pageRouteBox(context, 'Neumorphisim Page',
                        () => routeToNeumorphicPage())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageRouteBox(BuildContext context, String text, Function()? onTap) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: Get.height * 0.1,
          width: Get.width * 0.3,
          child: Card(
            child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child:
                      Text(text, style: Theme.of(context).textTheme.bodyMedium),
                )),
          ),
        ),
      );

  routeToFadeTransitionPage() {
    _fc.onPageInit();
    Get.to(() => FadeTransitionPage());
  }

  routeToSizeTransitionPage() {
    _sc.onPageInit();
    Get.to(() => SizeTransitionPage());
  }

  routeToSlideTransitionPage() {
    _stc.onPageInit();
    Get.to(() => SlideTransitionPage());
  }

  routeToRotationPage() {
    Get.to(() => RotationAnimationPage());
  }

  routeToNeumorphicPage() {
    _nc.initAnimate();
    Get.to(() => NeumorphismPage());
  }
}
