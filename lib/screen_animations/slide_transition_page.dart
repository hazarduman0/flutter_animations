import 'package:animations/controllers/slide_transition_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlideTransitionPage extends StatelessWidget {
  SlideTransitionPage({Key? key}) : super(key: key);

  final SlideTransitionController _stc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _stc.onPageDispose();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Slide Transition Page'),    
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.3,
              width: Get.width,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.05),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  return listViewContainer;
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: mainContainer,
            ),
          ],
        ),
      ),
    );
  }

  Widget get listViewContainer => Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
        child: SlideTransition(
          position: _stc.animationOffset!,
          child: Container(
            height: Get.height * 0.2,
            width: Get.width * 0.2,
            decoration: BoxDecoration(
                color: Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
      );

  Widget get mainContainer => SlideTransition(
        position: _stc.animationOffset!,
        child: Container(
            height: Get.height * 0.5,
            width: Get.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(20.0))),
      );
}
