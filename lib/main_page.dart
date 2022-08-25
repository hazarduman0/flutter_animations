import 'package:animations/controllers/animated_builder/animated_rotation_controller.dart';
import 'package:animations/controllers/animated_builder/animated_slide_controller.dart';
import 'package:animations/controllers/animated_builder/animated_transform_controller.dart';
import 'package:animations/controllers/fade_transition_controller.dart';
import 'package:animations/controllers/neumorphism_controller.dart';
import 'package:animations/controllers/size_transition_controller.dart';
import 'package:animations/controllers/slide_transition_controller.dart';
import 'package:animations/screen_animations/animated_builder/rotation_page.dart';
import 'package:animations/screen_animations/animated_builder/slide_page.dart';
import 'package:animations/screen_animations/animated_builder/transform_page.dart';
import 'package:animations/screen_animations/custom_animations/custom_main.dart';
import 'package:animations/screen_animations/fade_transition_page.dart';
import 'package:animations/screen_animations/neumorphism_page.dart';
import 'package:animations/screen_animations/rotation_animation_page.dart';
import 'package:animations/screen_animations/size_transition_page.dart';
import 'package:animations/screen_animations/slide_transition_page.dart';
import 'package:animations/screen_animations/tween_animation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final FadeTransitionController _fc = Get.find();
  final SizeTransitionController _sc = Get.find();
  final SlideTransitionController _stc = Get.find();
  final NeumorphismController _nc = Get.find();
  final AnimatedBuilderRotationController _arc = Get.find();
  final AnimatedBuilderSlideController _asc = Get.find();
  final AnimatedBuilderTransformController _atc = Get.find();

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
                    pageRouteBox(
                        context, 'Custom Main', () => routeToCustomMain(),
                        color: Colors.blueAccent.shade100),
                    pageRouteBox(context, 'Fade Transition Page',
                        () => routeToFadeTransitionPage()),
                    pageRouteBox(context, 'Size Transition Page',
                        () => routeToSizeTransitionPage()),
                    pageRouteBox(context, 'Slide Transition Page',
                        () => routeToSlideTransitionPage()),
                    pageRouteBox(
                        context, 'Rotation Page', () => routeToRotationPage()),
                    pageRouteBox(context, 'Neumorphisim Page',
                        () => routeToNeumorphicPage()),
                    pageRouteBox(context, 'Tween Animation Demo',
                        () => routeToTweenAnimationDemo()),
                    pageRouteBox(context, 'ABRotation',
                        () => routeToAnimatedBuilderRotationPage()),
                    pageRouteBox(context, 'ABSlide',
                        () => routeToAnimatedBuilderSlidePage()),
                    pageRouteBox(context, 'ABTransform',
                        () => routeToAnimatedBuilderTransformPage())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageRouteBox(BuildContext context, String text, Function()? onTap,
          {Color? color}) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: Get.height * 0.1,
          width: Get.width * 0.3,
          child: Card(
            color: color,
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

  routeToCustomMain() {
    Get.to(() => CustomMain());
  }

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
    Get.to(() => const RotationAnimationPage());
  }

  routeToNeumorphicPage() {
    _nc.initAnimate();
    Get.to(() => NeumorphismPage());
  }

  routeToTweenAnimationDemo() {
    Get.to(() => const TweenAnimationPage());
  }

  routeToAnimatedBuilderRotationPage() {
    _arc.initController();
    Get.to(() => AnimatedBuilderRotationPage());
  }

  routeToAnimatedBuilderSlidePage() {
    _asc.initController();
    Get.to(() => AnimatedBuilderSlidePage());
  }

  routeToAnimatedBuilderTransformPage() {
    _atc.initController();
    Get.to(() => AnimatedBuilderTransformPage());
  }
}
