import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TweenAnimationPage extends StatelessWidget {
  const TweenAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Tween Animation Demo'),
      ),
      body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: _tweenAnimation(context)),
    );
  }

  Widget _tweenAnimation(BuildContext context) => TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 1500),
        builder: (BuildContext context, double value, Widget? child) {
          return Opacity(
            opacity: value,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: value  * 150, horizontal: value * 40),
                child: child),
          );
        },
        child: SizedBox(
          height: 150,
          width: 150,
          child: Card(
            child: Center(
                child: Text('Its Me',
                    style: Theme.of(context).textTheme.headline3)),
          ),
        ),
      );
}
