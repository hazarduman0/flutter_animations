import 'package:get/get.dart';

class RotationController extends GetxController{
  RxBool _isTapped = false.obs;
  RxDouble _turns = 0.0.obs;

  bool get isTapped => _isTapped.value;
  double get turns => _turns.value;

  tapTheBox(){
    _isTapped.value = !_isTapped.value;
    update();
    rotateTheBox();
  }

  rotateTheBox(){
    _isTapped.value ? _turns.value -= 1/4 : _turns.value += 1/4;
    update();
  }


}