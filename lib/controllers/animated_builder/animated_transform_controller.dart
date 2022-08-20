import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedBuilderTransformController extends GetxController
    with GetTickerProviderStateMixin {
  Rx<AnimationController?> _animationController = Rxn();
  Rx<Animation<double>?> _sizeAnimation = Rxn();
  Rx<Animation<BorderRadius?>?> _radiusAnimation = Rxn();
  RxBool _isClicked = false.obs;

  AnimationController? get animationController => _animationController.value;
  Animation<double>? get sizeAnimation => _sizeAnimation.value;
  Animation<BorderRadius?>? get radiusAnimation => _radiusAnimation.value;
  bool get isClicked => _isClicked.value;

  initController() {
    _animationController.value = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    update();

    final curvedAnimation = CurvedAnimation(
        parent: _animationController.value!, curve: Curves.easeIn);

    _sizeAnimation.value =
        Tween<double>(begin: 150, end: 300).animate(curvedAnimation);
    update();
    _radiusAnimation.value = BorderRadiusTween(
            begin: BorderRadius.circular(60.0),
            end: BorderRadius.circular(10.0))
        .animate(curvedAnimation);
  }

  tapBox(){
    _isClicked.value = !_isClicked.value;
    update();
    changeBox();
  }

  changeBox(){
    _isClicked.value ? _animationController.value!.forward() : _animationController.value!.reverse();
    update();
  }

  disposePage(){
    _isClicked.value = false;
    _animationController.value!.dispose();
    update();
  }
}
