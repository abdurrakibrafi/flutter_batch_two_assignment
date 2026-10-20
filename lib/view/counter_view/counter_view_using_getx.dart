import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/count_controller.dart';

class CounterScreenUsingGet extends StatelessWidget {
  const CounterScreenUsingGet({super.key});

  @override
  Widget build(BuildContext context) {
    /// instance of controller
    final CounterController counterController = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Counter App using Getx"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// minus button
            ElevatedButton(
              onPressed: () {
                counterController.decrement();
              },
              child: const Icon(Icons.remove),
            ),

            const SizedBox(width: 20),

            Obx(
              () => Text(
                "${counterController.counter.value}",
                style: const TextStyle(fontSize: 30),
              ),
            ),

            const SizedBox(width: 20),

            /// plus button
            ElevatedButton(
              onPressed: () {
                counterController.increment();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
