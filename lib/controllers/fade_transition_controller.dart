import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class FadeTransitionController extends GetxController
    with GetTickerProviderStateMixin {
  Rx<AnimationController?> _animationController = Rxn();
  Rx<Animation<double>?> _animation = Rxn();

  AnimationController? get animationController => _animationController.value;
  Animation<double>? get animation => _animation.value;

  @override
  void onInit() {
    super.onInit();
  }

  onPageInit() {
   _animationController.value =  AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500)); //..repeat(reverse: true);

    //_animationController.forward();    
   
     _animation.value =  CurvedAnimation(parent: _animationController.value!, curve: Curves.linear);
     Timer(const Duration(milliseconds: 500), ()=> _animationController.value!.forward());
    update();
  }

  onPageDispose() {
    _animationController.value!.dispose();
    update();
  }
}
