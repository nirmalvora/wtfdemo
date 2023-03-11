import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtfdemo/core/utils/color_constants.dart';
import 'package:wtfdemo/core/widgets/general_membership_list/general_membership_list.dart';
import 'package:wtfdemo/core/widgets/home_header_widget.dart';
import 'package:wtfdemo/ui/home_screen/home_controller.dart';

import '../../core/widgets/goal_focused_membership/goal_focused_membership_carousel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefefef),
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        leadingWidth: 50,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
            color: Colors.black),
        title: const Text(
          "Membership",
          style:
              TextStyle(color: ColorConstants.appBarTitleColor, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: Colors.black))
        ],
        centerTitle: false,
      ),
      body: Obx(
        () =>
            controller.loading.value && controller.gymPlanResponse.value == null
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                : RefreshIndicator(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: Column(
                        children: [
                          const HomeHeaderWidget(
                              imageUrl: 'https://picsum.photos/1600/900'),
                          GoalFocusedMemberShipCarousel(
                              goalList:
                                  (controller.gymPlanResponse.value?.data ?? [])
                                      .where((element) => element.isGoal == 1)
                                      .toList()),
                          GeneralMemberShipList(
                              goalList:
                                  (controller.gymPlanResponse.value?.data ?? [])
                                      .where((element) => element.isGoal == 0)
                                      .toList()),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: const LinearGradient(colors: [
                                  Color(0xffb4180b),
                                  Color(0xffdd2003)
                                ])),
                            child: const Center(
                                child: Text(
                              "Proceed",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          ),
                        ],
                      ),
                    ),
                    onRefresh: () async {
                      await controller.getHomeSccreenData();
                    },
                  ),
      ),
    );
  }
}
