import 'package:get/get.dart';
import 'home_screen_item_model.dart';

class HomeModel {
  RxList<HomeScreenItemModel> homeScreenItemList =
      RxList.filled(6, HomeScreenItemModel());
}
