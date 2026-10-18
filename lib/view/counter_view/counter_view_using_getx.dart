import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter.value++;
  }

  void decrement() {
    counter.value--;
  }
}

class CounterScreenUsingGet extends StatelessWidget {
  const CounterScreenUsingGet({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App using Getx"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.decrement();
              },
              child: const Icon(Icons.remove),
            ),

            const SizedBox(width: 20),

            Obx(
              () => Text(
                "${controller.counter.value}",
                style: const TextStyle(fontSize: 30),
              ),
            ),

            const SizedBox(width: 20),

            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
