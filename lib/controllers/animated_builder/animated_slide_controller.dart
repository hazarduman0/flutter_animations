import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedBuilderSlideController extends GetxController
    with GetTickerProviderStateMixin {
  Rx<AnimationController?> _animationController = Rxn();
  Rx<Animation<double>?> _animation = Rxn();
  RxBool _isClicked = false.obs;
  RxBool _isAnimated = false.obs;

  AnimationController? get animationController => _animationController.value;
  Animation<double>? get animation => _animation.value;
  bool get isClicked => _isClicked.value;
  bool get isAnimated => _isAnimated.value;

  click() async {
    if (_isClicked.value) {
      disposeContainer();
      _isAnimated.value = true;
      update();
      await Future.delayed(const Duration(milliseconds: 1500));
      _isAnimated.value = false;
      update();
    } else {
      getContainer();
    }
    _isClicked.value = !_isClicked.value;
    update();
    // !_isClicked.value ? disposeContainer() : getContainer();
  }

  initController() {
    _animationController.value = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    update();

    final curvedAnimation = CurvedAnimation(
        parent: _animationController.value!, curve: Curves.linearToEaseOut);

    update();
    _animation.value =
        Tween<double>(begin: -1, end: 0).animate(curvedAnimation);

    update();
  }

  getContainer() {
    _animationController.value!.forward();

    update();
  }

  disposeContainer() {
    _animationController.value!.reverse();

    update();
  }

  disposePage() {
    _isClicked.value = false;
    _isAnimated.value = false;
    _animationController.value!.dispose();
    update();
  }
}
