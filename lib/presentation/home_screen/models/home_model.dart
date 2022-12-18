import 'package:get/get.dart';
import 'home_screen_item_model.dart';

class CustomerHomeScreenModel {
  RxList<CustomerHomeScreenItemModel> CustomerHomeScreenItemList =
      RxList.filled(6, CustomerHomeScreenItemModel());
}
