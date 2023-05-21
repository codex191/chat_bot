import 'package:get/get.dart';

import '../modules/ChatPage/bindings/chat_page_binding.dart';
import '../modules/ChatPage/views/chat_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_PAGE,
      page: () => ChatPageView(),
      binding: ChatPageBinding(),
    ),
  ];
}
