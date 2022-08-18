import 'package:animations/controllers/neumorphism_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NeumorphismPage extends StatelessWidget {
  NeumorphismPage({Key? key}) : super(key: key);

  final NeumorphismController _nc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _nc.disposePage();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Neumorphism Page'),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: neumorphicBox(),
        ),
      ),
    );
  }

  Widget neumorphicBox() => GetBuilder<NeumorphismController>(builder: (nc) {
        return GestureDetector(
          onTap: () {
            nc.clickTheBox();
          },
          child: AnimatedRotation(
            curve: Curves.elasticOut,
            duration: const Duration(milliseconds: 1500),
            turns: nc.turns,
            child: AnimatedContainer(
              height: 300,
              width: 300,
              curve: Curves.elasticOut,
              duration: const Duration(milliseconds: 1500),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                  boxShadow:  [
                    BoxShadow(
                        blurRadius: 30.0,
                        offset: nc.isClicked ? const Offset(20, -20) : const Offset(-20, -20),
                        color: Colors.grey),
                    BoxShadow(
                        blurRadius: 30.0,
                        offset: nc.isClicked ? const Offset(-20, 20) : const Offset(20, 20),
                        color: Colors.white)
                  ]),
              child: Center(
                  child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: nc.animationController!,
                size: 150,
                color: Colors.black,
              )),
            ),
          ),
        );
      });
}
