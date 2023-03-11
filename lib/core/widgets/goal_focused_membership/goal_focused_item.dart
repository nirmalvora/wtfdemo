import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtfdemo/core/model/gym_plan/gym_plan_response.dart';
import 'package:wtfdemo/core/navigation/navigation_constant.dart';
import 'package:wtfdemo/core/widgets/dashed_line.dart';
import 'package:wtfdemo/core/widgets/goal_focused_membership/goal_tiket_background_widget.dart';

class GoalFocusedItem extends StatelessWidget {
  final Function() onTap;
  final MapEntry<int, GymPlanData> goalData;
  final bool isSelected;
  const GoalFocusedItem(
      {Key? key,
      required this.onTap,
      required this.goalData,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = isSelected ? Colors.white : Colors.black;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipPath(
            clipper: GoalTicketBackgroundWidget(holeRadius: 40),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                color: isSelected ? Colors.black : Colors.white,
              ),
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Hero(
                      tag: goalData.value.id.toString(),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://picsum.photos/160${goalData.key}/90${goalData.key}',
                        placeholder: (context, url) => const AspectRatio(
                          aspectRatio: 16 / 9,
                          child: SizedBox(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            goalData.value.planName ?? '',
                            maxLines: 1,
                            style: TextStyle(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DashedLine(
                    color: textColor,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            goalData.value.description ?? '',
                            maxLines: 2,
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(NavigationName.goalDetail,
                              arguments: goalData),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: textColor),
                                borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            child: Text(
                              "View Details",
                              style: TextStyle(color: textColor, fontSize: 12),
                            ),
                          ),
                        ),
                        Text(
                          "₹${goalData.value.planPrice ?? ''}",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
