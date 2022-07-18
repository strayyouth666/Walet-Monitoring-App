import 'package:get/get.dart';

import 'package:protel_1/app/modules/auth/bindings/auth_binding.dart';
import 'package:protel_1/app/modules/auth/views/auth_view.dart';
import 'package:protel_1/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:protel_1/app/modules/dashboard/views/dashboard_view.dart';
import 'package:protel_1/app/modules/home/bindings/home_binding.dart';
import 'package:protel_1/app/modules/home/views/home_view.dart';
import 'package:protel_1/app/modules/nest/bindings/nest_binding.dart';
import 'package:protel_1/app/modules/nest/views/nest_view.dart';
import 'package:protel_1/app/modules/nested/bindings/nested_binding.dart';
import 'package:protel_1/app/modules/nested/views/nested_view.dart';
import 'package:protel_1/app/modules/profile/bindings/profile_binding.dart';
import 'package:protel_1/app/modules/profile/views/profile_view.dart';
import 'package:protel_1/app/modules/register/bindings/register_binding.dart';
import 'package:protel_1/app/modules/register/views/register_view.dart';
import 'package:protel_1/app/modules/securitypin/bindings/securitypin_binding.dart';
import 'package:protel_1/app/modules/securitypin/views/securitypin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.NEST,
      page: () => NestView(),
      binding: NestBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NESTED,
      page: () => NestedView(),
      binding: NestedBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    // GetPage(
    //   name: _Paths.SECURITYPIN,
    //   page: () => SecuritypinView(),
    //   binding: SecuritypinBinding(),
    // ),
  ];
}
