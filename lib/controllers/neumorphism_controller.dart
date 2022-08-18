import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class NeumorphismController extends GetxController
    with GetTickerProviderStateMixin {
  RxBool _isClicked = false.obs;
  RxDouble _turns = 0.0.obs;
  Rx<AnimationController?> _animationController = Rxn();

  bool get isClicked => _isClicked.value;
  double get turns => _turns.value;
  AnimationController? get animationController => _animationController.value;

  clickTheBox() {
    _isClicked.value = !_isClicked.value;
    update();
    rotateTheBox();
  }

  rotateTheBox() {
    if (_isClicked.value) {
      _turns.value -= 1 / 4;
      _animationController.value!.forward();
    } else {
      _turns.value += 1 / 4;
      _animationController.value!.reverse();
    }
    update();
  }

  initAnimate() {
    _animationController.value = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    update();
  }

  disposePage() {
    _isClicked.value = false;
    _turns.value = 0.0;
    _animationController.value!.dispose();
    update();
  }
}
