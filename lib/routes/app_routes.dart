import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp2/presentation/home_screen/home_screen.dart';
import 'package:fyp2/presentation/home_screen/binding/home_binding.dart';
import 'package:fyp2/presentation/navbar/Binding/navbar_binding.dart';
import 'package:fyp2/presentation/navbar/navbar.dart';
import 'package:fyp2/presentation/navbar_serviceprovider/navbar_serviceprovider.dart';
import 'package:fyp2/presentation/sign_up_page_customer_screen/sign_up_page_customer_screen.dart';
import 'package:fyp2/presentation/sign_up_page_customer_screen/binding/sign_up_page_customer_binding.dart';
import 'package:fyp2/presentation/login_page_customer_screen/login_page_customer_screen.dart';
import 'package:fyp2/presentation/login_page_customer_screen/binding/login_page_customer_binding.dart';
import 'package:fyp2/presentation/forget_password_page_screen/forget_password_page_screen.dart';
import 'package:fyp2/presentation/forget_password_page_screen/binding/forget_password_page_binding.dart';
import 'package:fyp2/presentation/login_page_service_screen/login_page_service_screen.dart';
import 'package:fyp2/presentation/login_page_service_screen/binding/login_page_service_binding.dart';
import 'package:fyp2/presentation/sign_up_page_service_screen/sign_up_page_service_screen.dart';
import 'package:fyp2/presentation/sign_up_page_service_screen/binding/sign_up_page_service_binding.dart';
import 'package:fyp2/presentation/search_screen/search_screen.dart';
import 'package:fyp2/presentation/search_screen/binding/search_binding.dart';
import 'package:fyp2/presentation/serviice_provider_page_screen/serviice_provider_page_screen.dart';
import 'package:fyp2/presentation/serviice_provider_page_screen/binding/serviice_provider_page_binding.dart';
import 'package:fyp2/presentation/service_provider_homepage_screen/service_provider_homepage_screen.dart';
import 'package:fyp2/presentation/service_provider_homepage_screen/binding/service_provider_homepage_binding.dart';
import 'package:fyp2/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:fyp2/presentation/my_profile_screen/binding/my_profile_binding.dart';
import 'package:fyp2/presentation/edit_service_page_screen/edit_service_page_screen.dart';
import 'package:fyp2/presentation/edit_service_page_screen/binding/edit_service_page_binding.dart';
import 'package:fyp2/presentation/dashboard_page_screen/dashboard_page_screen.dart';
import 'package:fyp2/presentation/dashboard_page_screen/binding/dashboard_page_binding.dart';
import 'package:fyp2/presentation/wallet_page_screen/wallet_page_screen.dart';
import 'package:fyp2/presentation/wallet_page_screen/binding/wallet_page_binding.dart';
import 'package:fyp2/presentation/serviie_provider_page_available_screen/serviie_provider_page_available_screen.dart';
import 'package:fyp2/presentation/serviie_provider_page_available_screen/binding/serviie_provider_page_available_binding.dart';
import 'package:fyp2/presentation/serviice_provider_page_available_screen/serviice_provider_page_available_screen.dart';
import 'package:fyp2/presentation/serviice_provider_page_available_screen/binding/serviice_provider_page_available_binding.dart';
import 'package:fyp2/presentation/category_page_screen/category_page_screen.dart';
import 'package:fyp2/presentation/category_page_screen/binding/category_page_binding.dart';
import 'package:fyp2/presentation/edit_store_page_screen/edit_store_page_screen.dart';
import 'package:fyp2/presentation/edit_store_page_screen/binding/edit_store_page_binding.dart';
import 'package:fyp2/presentation/setting_page_screen/setting_page_screen.dart';
import 'package:fyp2/presentation/setting_page_screen/binding/setting_page_binding.dart';
import 'package:fyp2/presentation/edit_service_page_one_screen/edit_service_page_one_screen.dart';
import 'package:fyp2/presentation/edit_service_page_one_screen/binding/edit_service_page_one_binding.dart';
import 'package:fyp2/presentation/edit_profile_page_screen/edit_profile_page_screen.dart';
import 'package:fyp2/presentation/edit_profile_page_screen/binding/edit_profile_page_binding.dart';
import 'package:fyp2/presentation/set_appointment_screen/set_appointment_screen.dart';
import 'package:fyp2/presentation/set_appointment_screen/binding/set_appointment_binding.dart';
import 'package:fyp2/presentation/add_service_page_screen/add_service_page_screen.dart';
import 'package:fyp2/presentation/add_service_page_screen/binding/add_service_page_binding.dart';
import 'package:fyp2/presentation/change_password_page_screen/change_password_page_screen.dart';
import 'package:fyp2/presentation/change_password_page_screen/binding/change_password_page_binding.dart';
import 'package:fyp2/presentation/welcomescreen_page_screen/binding/welcomescreen_page_binding.dart';
import 'package:fyp2/presentation/welcomescreen_page_screen/welcomescreen_page_screen.dart';

import 'package:get/get.dart';

class AppRoutes {

  static String navbarcustomer = '/navbarcustomer_screen';

  static String navbarserviceprovider = '/navbarserviceprovider_screen';

  static String customerHomeScreen = '/home_screen';

  static String signUpPageCustomerScreen = '/sign_up_page_customer_screen';

  static String loginPageCustomerScreen = '/login_page_customer_screen';

  static String forgetPasswordPageScreen = '/forget_password_page_screen';

  static String welcomePageScreen = '/Welcome_page_screen';

  static String loginPageServiceScreen = '/login_page_service_screen';

  static String signUpPageServiceScreen = '/sign_up_page_service_screen';

  static String searchScreen = '/search_screen';

  static String serviiceProviderPageScreen = '/serviice_provider_page_screen';

  static String serviceProviderHomepageScreen =
      '/service_provider_homepage_screen';

  static String myProfileScreen = '/my_profile_screen';

  static String editServicePageScreen = '/edit_service_page_screen';

  static String dashboardPageScreen = '/dashboard_page_screen';

  static String walletPageScreen = '/wallet_page_screen';

  static String searchSelectCategoryPageScreen =
      '/search_select_category_page_screen';

  static String serviieProviderPageAvailableScreen =
      '/serviie_provider_page_available_screen';

  static String orderPagePendingTabContainerScreen =
      '/order_page_pending_tab_container_screen';

  static String serviiceProviderPageAvailableScreen =
      '/serviice_provider_page_available_screen';

  static String categoryPageScreen = '/category_page_screen';

  static String editStorePageScreen = '/edit_store_page_screen';

  static String settingPageScreen = '/setting_page_screen';

  static String searchSelectCategoryPageOneScreen =
      '/search_select_category_page_one_screen';

  static String serviiceProviderPageNotAvailableScreen =
      '/serviice_provider_page_not_available_screen';

  static String editServicePageOneScreen = '/edit_service_page_one_screen';

  static String editProfilePageScreen = '/edit_profile_page_screen';

  static String setAppointmentScreen = '/set_appointment_screen';

  static String addServicePageScreen = '/add_service_page_screen';

  static String changePasswordPageScreen = '/change_password_page_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: navbarcustomer,
      page: () => NavbarCustomerPage(selectedindex: 0,),
      bindings: [
        NavbarBinding(),
      ],
    ),
    GetPage(
      name: navbarserviceprovider,
      page: () => NavbarServiceProviderPage(),
      bindings: [
        NavbarBinding(),
      ],
    ),
    GetPage(
      name: customerHomeScreen,
      page: () => CustomerHomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: signUpPageCustomerScreen,
      page: () => SignUpPageCustomerScreen(),
      bindings: [
        SignUpPageCustomerBinding(),
      ],
    ),
    GetPage(
      name: loginPageCustomerScreen,
      page: () => LoginPageCustomerScreen(),
      bindings: [
        LoginPageCustomerBinding(),
      ],
    ),
    GetPage(
      name: forgetPasswordPageScreen,
      page: () => ForgetPasswordPageScreen(),
      bindings: [
        ForgetPasswordPageBinding(),
      ],
    ),
    GetPage(
      name: welcomePageScreen,
      page: () => WelcomePageScreen(),
      bindings: [
        WelcomePageBinding(),
      ],
    ),
    GetPage(
      name: loginPageServiceScreen,
      page: () => LoginPageServiceScreen(),
      bindings: [
        LoginPageServiceBinding(),
      ],
    ),
    GetPage(
      name: signUpPageServiceScreen,
      page: () => SignUpPageServiceScreen(),
      bindings: [
        SignUpPageServiceBinding(),
      ],
    ),
    GetPage(
      name: searchScreen,
      page: () => SearchScreen(availability: '',category: '',location: '',),
      bindings: [
        SearchBinding(),
      ],
    ),
    GetPage(
      name: serviiceProviderPageScreen,
      page: () => ServiiceProviderPageScreen(),
      bindings: [
        ServiiceProviderPageBinding(),
      ],
    ),
    GetPage(
      name: serviceProviderHomepageScreen,
      page: () => ServiceProviderHomepageScreen(suppId: FirebaseAuth.instance.currentUser!.uid),
      bindings: [
        ServiceProviderHomepageBinding(),
      ],
    ),
    GetPage(
      name: myProfileScreen,
      page: () => MyProfileScreen(),
      bindings: [
        MyProfileBinding(),
      ],
    ),
    GetPage(
      name: editServicePageScreen,
      page: () => EditServicePageScreen(),
      bindings: [
        EditServicePageBinding(),
      ],
    ),
    GetPage(
      name: dashboardPageScreen,
      page: () => DashboardPageScreen(),
      bindings: [
        DashboardPageBinding(),
      ],
    ),
    GetPage(
      name: walletPageScreen,
      page: () => WalletPageScreen(),
      bindings: [
        WalletPageBinding(),
      ],
    ),

    GetPage(
      name: serviieProviderPageAvailableScreen,
      page: () => ServiieProviderPageAvailableScreen(),
      bindings: [
        ServiieProviderPageAvailableBinding(),
      ],
    ),
    GetPage(
      name: serviiceProviderPageAvailableScreen,
      page: () => ServiiceProviderPageAvailableScreen(),
      bindings: [
        ServiiceProviderPageAvailableBinding(),
      ],
    ),
    GetPage(
      name: categoryPageScreen,
      page: () => CategoryPageScreen(),
      bindings: [
        CategoryPageBinding(),
      ],
    ),
    GetPage(
      name: editStorePageScreen,
      page: () => EditStorePageScreen(),
      bindings: [
        EditStorePageBinding(),
      ],
    ),
    GetPage(
      name: settingPageScreen,
      page: () => SettingPageScreen(),
      bindings: [
        SettingPageBinding(),
      ],
    ),


    GetPage(
      name: editServicePageOneScreen,
      page: () => EditServicePageOneScreen(services: ''),
      bindings: [
        EditServicePageOneBinding(),
      ],
    ),
    GetPage(
      name: editProfilePageScreen,
      page: () => EditProfilePageScreen(data: ''),
      bindings: [
        EditProfilePageBinding(),
      ],
    ),
    GetPage(
      name: setAppointmentScreen,
      page: () => SetAppointmentScreen(),
      bindings: [
        SetAppointmentBinding(),
      ],
    ),
    GetPage(
      name: addServicePageScreen,
      page: () => AddServicePageScreen(),
      bindings: [
        AddServicePageBinding(),
      ],
    ),
    GetPage(
      name: changePasswordPageScreen,
      page: () => ChangePasswordPageScreen(),
      bindings: [
        ChangePasswordPageBinding(),
      ],
    )
  ];
}
