import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlideTransitionController extends GetxController
    with GetTickerProviderStateMixin {
  Rx<AnimationController?> _animationController = Rxn();
  Rx<Animation<Offset>?> _animationOffset = Rxn();

  AnimationController? get animationController => _animationController.value;
  Animation<Offset>? get animationOffset => _animationOffset.value;

  onPageInit() {
    _animationController.value = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)); //..repeat(reverse: true);

    //_animationController.forward();

    _animationOffset.value = Tween<Offset>(
      begin: const Offset(-2.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
        parent: _animationController.value!, curve: Curves.elasticOut));
    Timer(const Duration(milliseconds: 200),
        () => _animationController.value!.forward());
    update();
  }

  onPageDispose() {
    _animationController.value!.dispose();
    update();
  }
}
