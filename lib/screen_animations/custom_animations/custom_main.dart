import 'package:animations/controllers/custom_animation_controller/book_consept_controller.dart';
import 'package:animations/screen_animations/custom_animations/book_consept.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMain extends StatelessWidget {
   CustomMain({Key? key}) : super(key: key);

  final BookConseptController _bcc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Get.width * 0.2,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            const Icon(Icons.home, color: Colors.black, size: 25.0)
          ],
        ),
        title: const Text('Custom Animations'),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            children: [
              pageRouteBox(context, 'Book Consept', () => routeToBookConsept())
            ],
          ),
        ),
      ),
    );
  }

  Widget pageRouteBox(BuildContext context, String text, Function()? onTap) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: Get.height * 0.1,
          width: Get.width * 0.3,
          child: Card(
            child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child:
                      Text(text, style: Theme.of(context).textTheme.bodyMedium),
                )),
          ),
        ),
      );

  routeToBookConsept() {
    _bcc.initController();
    Get.to(() => BookConsept());
  }
}
