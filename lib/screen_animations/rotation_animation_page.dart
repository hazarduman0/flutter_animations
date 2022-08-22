import 'package:animations/controllers/rotation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotationAnimationPage extends StatelessWidget {
  const RotationAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Rotation Page'),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: rotateBox(context),
        ),
      ),
    );
  }

  Widget rotateBox(BuildContext context) => GetBuilder<RotationController>(
    builder: (rc) {
      return AnimatedRotation(
            curve: Curves.elasticOut,
            turns: rc.turns,
            duration: const Duration(milliseconds: 1500),
            child: GestureDetector(
              onTap: () {
                rc.tapTheBox();
              },
              child: SizedBox(
                height: 300,
                width: 300,
                child: Card(
                  elevation: 10.0,
                  child: Center(
                    child: Text('Tap me',
                        style: Theme.of(context).textTheme.headline4),
                  ),
                ),
              ),
            ),
          );
    }
  );
}
