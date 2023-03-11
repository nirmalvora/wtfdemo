import 'package:get/get.dart';
import 'package:wtfdemo/core/navigation/navigation_constant.dart';
import 'package:wtfdemo/ui/goal_detail_screen/goal_detail_screen.dart';
import 'package:wtfdemo/ui/home_screen/home_screen.dart';

class NavigationRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: NavigationName.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: NavigationName.goalDetail,
      page: () {
        return GoalDetailScreen(goalPlan: Get.arguments);
      },
    ),
  ];
}
