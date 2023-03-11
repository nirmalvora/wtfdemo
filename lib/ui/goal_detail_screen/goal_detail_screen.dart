import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtfdemo/core/model/gym_plan/gym_plan_response.dart';
import 'package:wtfdemo/core/utils/color_constants.dart';
import 'package:wtfdemo/core/widgets/home_header_widget.dart';

class GoalDetailScreen extends StatelessWidget {
  final MapEntry<int, GymPlanData> goalPlan;
  const GoalDetailScreen({Key? key, required this.goalPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () => Get.back(), color: Colors.black),
        title: Text(
          goalPlan.value.planName ?? '',
          style: const TextStyle(
              color: ColorConstants.appBarTitleColor, fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                      tag: goalPlan.value.id.toString(),
                      child: HomeHeaderWidget(
                          imageUrl:
                              'https://picsum.photos/160${goalPlan.key}/90${goalPlan.key}'))
                ],
              ),
            ),
          ),
          ColoredBox(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(50)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 6),
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ),
                      Text(
                        "₹${goalPlan.value.planPrice ?? ''}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
