
import 'package:to_do_app/views/call/call_binding.dart';
import 'package:to_do_app/views/call/call_view.dart';
import 'package:to_do_app/views/home/home_binding.dart';
import 'package:to_do_app/views/home/home_view.dart';
import 'package:get/get.dart';


class AppRoutes {
  AppRoutes._(); 
  static final mainRoutes = [
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(name: Routes.CALL, page: () => CallView(), binding: CallBinding()),
  ];
}

class Routes {
  static const String HOME = '/home';
  static const String CALL = '/call';
}