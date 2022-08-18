import 'package:animations/controllers/fade_transition_controller.dart';
import 'package:animations/controllers/neumorphism_controller.dart';
import 'package:animations/controllers/rotation_controller.dart';
import 'package:animations/controllers/size_transition_controller.dart';
import 'package:animations/controllers/slide_transition_controller.dart';
import 'package:get/get.dart';

class AwaitBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    
    await Get.putAsync(() async => FadeTransitionController(), permanent: true);
    await Get.putAsync(() async => SizeTransitionController(), permanent: true);
    await Get.putAsync(() async => SlideTransitionController(), permanent: true);
    await Get.putAsync(() async => RotationController(), permanent: true); 
    await Get.putAsync(() async => NeumorphismController(), permanent: true); 
  }
}