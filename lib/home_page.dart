import 'package:metro_project/travel_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final textController = TextEditingController();
  var textEnabled = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            Spacer(), // Here, we can put a big picture for the Metro
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
                onChanged: (String a) {
                  textEnabled.value = a.trim().toLowerCase().isNotEmpty;
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Obx(() {
                  return ElevatedButton(
                    onPressed: textEnabled.value
                        ? () async {
                            await Get.to(
                              TravelPage(),
                              arguments: textController.text,
                              transition: Transition.rightToLeftWithFade,
                            );
                          }
                        : null,
                    child: Text('Get Started'),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
