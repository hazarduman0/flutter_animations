import 'package:animations/controllers/animated_builder/animated_transform_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AnimatedBuilderTransformPage extends StatelessWidget {
  AnimatedBuilderTransformPage({Key? key}) : super(key: key);

  AnimatedBuilderTransformController _atc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _atc.disposePage(); // devam
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Animated Builder Transform Page'),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: transformBox(context),
        ),
      ),
    );
  }

  Widget transformBox(BuildContext context) =>
      GetBuilder<AnimatedBuilderTransformController>(builder: (atc) {
        return AnimatedBuilder(
          animation: atc.sizeAnimation!,
          builder: (context, child) => GestureDetector(
            onTap: () {
              atc.tapBox();
            },
            child: Container(
              height: atc.sizeAnimation!.value,
              width: atc.sizeAnimation!.value,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: atc.radiusAnimation!.value),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      atc.isClicked ? 'Get me smaller' : 'Get me bigger!',
                      style: Theme.of(context).textTheme.headline6)),
            ),
          ),
        );
      });
}
