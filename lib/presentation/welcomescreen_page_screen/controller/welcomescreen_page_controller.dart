import 'package:fyp2/core/app_export.dart';
import 'package:fyp2/presentation/welcomescreen_page_screen/models/splashscreen_page_model.dart';

class WelcomePageController extends GetxController {
  Rx<WelcomePageModel> splashscreenPageModelObj =
      WelcomePageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
