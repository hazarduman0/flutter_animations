import 'package:animations/controllers/custom_animation_controller/book_consept_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookConsept extends StatelessWidget {
  BookConsept({Key? key}) : super(key: key);

  final BookConseptController _bcc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _bcc.disposePage();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Book Consept Page'),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SizedBox(
          height: Get.height * 0.8,
          width: Get.width,
          child: GetBuilder<BookConseptController>(builder: (bcc) {
            return ValueListenableBuilder<double>(
              valueListenable: bcc.notifierScroll!,
              builder: (context, value, _) {
                return PageView.builder(
                  controller: bcc.pageController,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final percentage = index - value;
                    return listViewContainer(
                        'Book${index + 1} preview', context, percentage.clamp(0.0, 1.0));
                  },
                );
              },
            );
          }),
        ),
      ),
    );
  }

  Widget listViewContainer(String conseptText, BuildContext context, double percentage) => GetBuilder<BookConseptController>(
    builder: (bcc) {
      print('percentageFunc: $percentage');
      return Column(
        children: [
          SizedBox(height: Get.height * 0.1),
          Transform(
            alignment: Alignment.centerLeft,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.01)
              ..rotateY(percentage),
            child: Container(
              height: Get.height * 0.5,
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.purpleAccent.shade100,
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
          SizedBox(height: Get.height * 0.1),
          Text(conseptText, style: Theme.of(context).textTheme.headline4)
        ],
      );
    }
  );
}
