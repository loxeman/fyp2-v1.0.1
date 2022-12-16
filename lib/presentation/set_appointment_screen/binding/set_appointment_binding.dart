import '../controller/set_appointment_controller.dart';
import 'package:get/get.dart';

class SetAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetAppointmentController());
  }
}
