import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtfdemo/core/model/gym_plan/gym_plan_response.dart';
import 'package:wtfdemo/core/widgets/general_membership_list/general_membership_ticket_item.dart';
import 'package:wtfdemo/ui/home_screen/home_controller.dart';

class GeneralMemberShipList extends StatelessWidget {
  final List<GymPlanData> goalList;
  GeneralMemberShipList({Key? key, required this.goalList}) : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Obx(
          () => GeneralMembershipTicketItem(
              onTap: () {
                controller.selectedGeneralMembership.value = index;
              },
              index: index,
              goalData: goalList[index],
              isSelected: index == controller.selectedGeneralMembership.value),
        );
      },
      shrinkWrap: true,
      itemCount: goalList.length,
    );
  }
}
