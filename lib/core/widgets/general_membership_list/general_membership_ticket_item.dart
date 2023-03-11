import 'package:flutter/material.dart';
import 'package:wtfdemo/core/model/gym_plan/gym_plan_response.dart';
import 'package:wtfdemo/core/utils/utils.dart';
import 'package:wtfdemo/core/widgets/dashed_line.dart';
import 'package:wtfdemo/core/widgets/general_membership_list/general_membership_ticket_view.dart';

class GeneralMembershipTicketItem extends StatelessWidget {
  final Function() onTap;
  final GymPlanData goalData;
  final int index;
  final bool isSelected;
  const GeneralMembershipTicketItem(
      {Key? key,
      required this.onTap,
      required this.goalData,
      required this.index,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = isSelected ? Colors.white : Colors.black;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: ClipPath(
          clipper: GeneralMembershipTicketView(right: 110, holeRadius: 40),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              color: isSelected ? Colors.black : Colors.white,
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  Utils.getTitleByDay(
                                      int.parse(goalData.duration ?? '0')),
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
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many ",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Center(
                      child: CustomPaint(
                          size: const Size(1, double.infinity),
                          painter: DashedLineVerticalPainter(color: textColor)),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹${goalData.planPrice ?? ''}",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "₹${(int.parse(goalData.planPrice ?? '0') / int.parse(goalData.duration ?? '1')).toStringAsFixed(2)}/day",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
