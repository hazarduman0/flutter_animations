import 'package:animations/controllers/animated_builder/animated_rotation_controller.dart';
import 'package:animations/controllers/animated_builder/animated_slide_controller.dart';
import 'package:animations/controllers/animated_builder/animated_transform_controller.dart';
import 'package:animations/controllers/custom_animation_controller/book_consept_controller.dart';
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
    await Get.putAsync(() async => AnimatedBuilderRotationController(), permanent: true);
    await Get.putAsync(() async => AnimatedBuilderSlideController(), permanent: true);
    await Get.putAsync(() async => AnimatedBuilderTransformController(), permanent: true);
    await Get.putAsync(() async => BookConseptController(), permanent: true);
  }
}