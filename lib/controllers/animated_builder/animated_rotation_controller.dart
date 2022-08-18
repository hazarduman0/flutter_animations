import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class AnimatedBuilderRotationController extends GetxController
    with GetTickerProviderStateMixin {
  Rx<AnimationController?> _animationController = Rxn();
  Rx<Animation<double>?> _animation = Rxn();
  RxBool _isClicked = false.obs;

  AnimationController? get animationController => _animationController.value;
  Animation<double>? get animation => _animation.value;
  bool get isClicked => _isClicked.value;

  clickTheBox() {
    _isClicked.value = !_isClicked.value;
    update();
    _isClicked.value ? rotateBox() : stopRotating();
  }

  initController() {
    _animationController.value = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);



    update();
    _animation.value = Tween<double>(begin: 0, end: 2 * pi)
        .animate(_animationController.value!);

    update();
  }

  disposePage() {
    _animationController.value!.dispose();
    _isClicked.value = false;
    update();
  }

  rotateBox() {
    _animationController.value!.repeat();
    update();
  }

  stopRotating() {
    _animationController.value!.stop();
    update();
  }
}
