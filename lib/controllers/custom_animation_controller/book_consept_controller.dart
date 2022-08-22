import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BookConseptController extends GetxController{
  Rx<PageController?> _pageController = Rxn();
  Rx<ValueNotifier<double>?> _notifierScroll = Rxn();
  RxDouble _percentage = 1.0.obs;

  PageController? get pageController => _pageController.value;
  ValueNotifier<double>? get notifierScroll => _notifierScroll.value;
  double get percentage => _percentage.value; 

  setPercentage(double percentage){
    _percentage.value = percentage;
    update();
  }

  initController(){
    _pageController.value = PageController();
    update();
    initNotifier();
    _pageController.value!.addListener(_listener);
    update();
  }

  initNotifier(){
    _notifierScroll.value = ValueNotifier(0.0);
    update();
  }

  void _listener(){
    _notifierScroll.value!.value = _pageController.value!.page!;
  }

  disposePage(){
    _pageController.value!.removeListener(_listener);
    _pageController.value!.dispose();
  }

}