import 'package:animations/controllers/animated_builder/animated_slide_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedBuilderSlidePage extends StatelessWidget {
   AnimatedBuilderSlidePage({Key? key}) : super(key: key);

  final AnimatedBuilderSlideController _asc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _asc.disposePage();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Animated Builder Slide Page'),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: GetBuilder<AnimatedBuilderSlideController>(builder: (asc) {
          return Center(
            child: asc.isClicked
                ? _slideBox(context)
                : TextButton(
                    onPressed: () {
                      asc.click();
                    },
                    child: Text('Get Me',
                        style: Theme.of(context).textTheme.headline3)),
          );
        }),
      ),
    );
  }

  Widget _slideBox(BuildContext context) =>
      GetBuilder<AnimatedBuilderSlideController>(builder: (asc) {
        return AnimatedBuilder(
          animation: asc.animation!,
          builder: (context, child) {
            final width = Get.width;
            final x = asc.animation!.value * width;
            return Transform(
              transform: Matrix4.translationValues(x, 0, 0),
              child: child,
              );
          },
          child: GestureDetector(
            onTap: !asc.isAnimated ? () {
               asc.click();
            } : null,
            child: Container(
              height: Get.height * 0.8,
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.purpleAccent.shade100,
                  border: Border.all(color: Colors.black.withOpacity(0.2), width: 15.0)),
              child: Center(
                child: Text('Dispose Me',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white)),
              ),
            ),
          ),
        );
      });
}
