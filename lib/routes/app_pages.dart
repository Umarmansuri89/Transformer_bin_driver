import 'package:get/get.dart';
import 'package:transformer_bin_driver/modules/splash/bindings/splash_binding.dart';
import '../modules/Burger_Manu/bindings/Burger_manu_binding.dart';
import '../modules/Burger_Manu/views/Burger_manu_view.dart';
import '../modules/Deshboard_screen/bindings/Dashboard_screen_binding.dart';
import '../modules/Deshboard_screen/views/Dashboard_screen_view.dart';
import '../modules/Information/Views/information_view.dart';
import '../modules/Information/bindings/information_biding.dart';
import '../modules/Login/bindings/Login_binding.dart';
import '../modules/Login/views/Login_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.SPLASH;
  static const INITIAL = Routes.SPLASH;

  static final routes = [

    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: _Paths.DASHBOARD_SCREEN,
      page: () => Dashboard_screen_View(),
      binding: Deshboard_screen_Binding(),
    ),

    GetPage(
      name: _Paths.BURGER_MANU,
      page: () => Burger_manu_View(),
      binding: Burger_manu_Binding(),
    ),

    GetPage(
      name: _Paths.INFORMTION,
      page: () => InformationView(),
      binding: Information_Binding(),
    ),

    /*GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => AboutusView(),
      binding: AboutusBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_CONDITION,
      page: () => TermsConditionView(),
      binding: TermsConditionBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DISCOVER_GIRL,
      page: () => DiscoverGirlView(),
      binding: DiscoverGirlBinding(),
    ),
    GetPage(
      name: _Paths.PACKAGE_LIST,
      page: () => PackageListView(),
      binding: PackageListBinding(),
    ),
    GetPage(
      name: _Paths.TOP_RATED_GIRL,
      page: () => TopRatedGirlView(),
      binding: TopRatedGirlBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.CITY_LIST,
      page: () => CityListView(),
      binding: CityListBinding(),
    ),

    GetPage(
      name: _Paths.COUNTRY_LIST,
      page: () => countryListView(),
      binding: countryListBinding(),
    ),
    GetPage(
      name: _Paths.STATE_LIST,
      page: () => stateListView(),
      binding: stateListBinding(),
    ),
    GetPage(
      name: _Paths.FAQ_NEW,
      page: () => FaqNewView(),
      binding: FaqNewBinding(),
    ),
    GetPage(
      name: _Paths.PARTY_DETAIL,
      page: () => PartyDetailView(),
      binding: PartyDetailBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_GIRL,
      page: () => SelectGirlView(),
      binding: SelectGirlBinding(),
    ),
    GetPage(
      name: _Paths.PARY_DETAIL_FORM,
      page: () => ParyDetailFormView(),
      binding: ParyDetailFormBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_CARD,
      page: () => AddNewCardView(),
      binding: AddNewCardBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_TYPE,
      page: () => ShowTypeView(),
      binding: ShowTypeBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SETTING,
      page: () => PaymentSettingView(),
      binding: PaymentSettingBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_HISTORY,
      page: () => OrderHistoryView(),
      binding: OrderHistoryBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL_SUMMARY,
      page: () => OrderDetailSummaryView(),
      binding: OrderDetailSummaryBinding(),
    ),


    GetPage(
      name: _Paths.FAQ_NEW_WITH_BACK_BUTTON,
      page: () => faq_new_with_back_button(),
      binding: FaqNewBinding_with_back_button(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SUCCESS,
      page: () => PaymentSuccess1(),
      binding: PaymentSuccessBinding(),
    ),*/
  ];
}
