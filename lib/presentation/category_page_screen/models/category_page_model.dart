import 'package:get/get.dart';
import 'category_page_item_model.dart';

class CategoryPageModel {
  RxList<CategoryPageItemModel> categoryPageItemList =
      RxList.filled(6, CategoryPageItemModel());
}
