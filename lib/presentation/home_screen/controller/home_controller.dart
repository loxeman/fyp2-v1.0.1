import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/home_screen/models/home_model.dart';

class CustomerHomeScreenController extends GetxController {

  Rx<CustomerHomeScreenModel> CustomerHomeScreenModelObj = CustomerHomeScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
    }

  @override
  void onClose() {
    super.onClose();
  }
}
