import 'dart:convert';

import 'package:get/get.dart';
import 'package:wtfdemo/core/model/gym_plan/gym_plan_response.dart';
import 'package:wtfdemo/core/services/api_service_methods.dart';
import 'package:wtfdemo/core/services/service_constant.dart';

class HomeController extends GetxController {
  final gymId = "GLKdIYAWDS2Q8";
  final selectedGoal = (-1).obs;
  final selectedGeneralMembership = (-1).obs;
  final currentCarouselItem = 0.obs;
  Rx<GymPlanResponse?> gymPlanResponse = Rx<GymPlanResponse?>(null);
  final loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getHomeSccreenData();
  }

  Future<void> getHomeSccreenData() async {
    selectedGoal.value = -1;
    selectedGeneralMembership.value = -1;
    loading.value = true;
    var response = await BaseApiService.instance
        .post(ServiceConstant.gymPlan, data: {'gym_id': gymId});
    gymPlanResponse.value = GymPlanResponse.fromJson(jsonDecode(response.body));
    loading.value = false;
  }
}
