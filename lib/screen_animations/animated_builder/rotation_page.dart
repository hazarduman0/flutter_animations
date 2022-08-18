import 'package:animations/controllers/animated_builder/animated_rotation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedBuilderRotationPage extends StatelessWidget {
   AnimatedBuilderRotationPage({Key? key}) : super(key: key);

  final AnimatedBuilderRotationController _arc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _arc.disposePage();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Animated Builder Rotation Page'),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: _boxBuild(context),
        ),
      ),
    );
  }

  Widget  _boxBuild(BuildContext context) =>
      GetBuilder<AnimatedBuilderRotationController>(builder: (arc) {
        return GestureDetector(
          onTap: () {
            arc.clickTheBox();
          },
          child: AnimatedBuilder(
            animation: arc.animation!,
            builder: (context, child) => Transform.rotate(
              angle: arc.animation!.value,
              child: child,
            ),
            child: SizedBox(
              height: 300,
              width: 300,
              child: Card(
                child: Center(
                  child: Text(!arc.isClicked ? 'Rotate Me' : 'Stop Me', style: Theme.of(context).textTheme.headline3),
                ),
              ),
            ),
          ),
        );
      });
}
