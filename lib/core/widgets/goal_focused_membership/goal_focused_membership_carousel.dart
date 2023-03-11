import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtfdemo/core/model/gym_plan/gym_plan_response.dart';
import 'package:wtfdemo/core/widgets/goal_focused_membership/goal_focused_item.dart';
import 'package:wtfdemo/ui/home_screen/home_controller.dart';

class GoalFocusedMemberShipCarousel extends StatelessWidget {
  final List<GymPlanData> goalList;
  GoalFocusedMemberShipCarousel({Key? key, required this.goalList})
      : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "Goal Focused Membership",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 8),
        Obx(
          () => CarouselSlider(
              items: goalList
                  .asMap()
                  .entries
                  .map(
                    (e) => GoalFocusedItem(
                        onTap: () {
                          controller.selectedGoal.value = e.key;
                        },
                        goalData: e,
                        isSelected: e.key == controller.selectedGoal.value),
                  )
                  .toList(),
              options: CarouselOptions(
                  autoPlay: false,
                  viewportFraction: 0.6,
                  enableInfiniteScroll: false,
                  padEnds: false,
                  aspectRatio: 1.4,
                  disableCenter: true,
                  onPageChanged: (index, reason) {
                    controller.currentCarouselItem.value = index;
                  })),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: goalList.asMap().entries.map((entry) {
              return Container(
                width: 6.0,
                height: 6.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(
                            controller.currentCarouselItem.value == entry.key
                                ? 0.9
                                : 0.4)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
