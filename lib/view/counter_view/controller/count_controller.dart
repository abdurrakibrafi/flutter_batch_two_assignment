
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CounterController extends GetxController {

  /// intial value k obs korchi
  var counter = 0.obs;

/// method increment
  void increment() {
    counter.value++;
  }

  /// method decrement
  void decrement() {
    counter.value--;
  }
}