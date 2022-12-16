import 'package:get/get.dart';
import 'dashboard_page_item_model.dart';

class DashboardPageModel {
  RxList<DashboardPageItemModel> dashboardPageItemList =
      RxList.filled(4, DashboardPageItemModel());
}
