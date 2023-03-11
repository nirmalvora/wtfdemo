class GymPlanResponse {
  bool? status;
  List<GymPlanData>? data;

  GymPlanResponse({this.status, this.data});

  GymPlanResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <GymPlanData>[];
      json['data'].forEach((v) {
        data!.add(GymPlanData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GymPlanData {
  int? id;
  String? planUid;
  String? planName;
  String? planPrice;
  String? taxPercentage;
  String? planType;
  String? duration;
  int? isRecomended;
  String? description;
  String? originalPrice;
  int? isGoal;
  String? packageId;
  int? isFestiv;
  String? festivBanner;
  String? validity;
  String? trainerId;
  String? trainerName;
  String? images;

  GymPlanData(
      {this.id,
      this.planUid,
      this.planName,
      this.planPrice,
      this.taxPercentage,
      this.planType,
      this.duration,
      this.isRecomended,
      this.description,
      this.originalPrice,
      this.isGoal,
      this.packageId,
      this.isFestiv,
      this.festivBanner,
      this.validity,
      this.trainerId,
      this.trainerName,
      this.images});

  GymPlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planUid = json['plan_uid'];
    planName = json['plan_name'];
    planPrice = json['plan_price'];
    taxPercentage = json['tax_percentage'];
    planType = json['plan_type'];
    duration = json['duration'];
    isRecomended = json['is_recomended'];
    description = json['description'];
    originalPrice = json['original_price'];
    isGoal = json['is_goal'];
    packageId = json['package_id'];
    isFestiv = json['is_festiv'];
    festivBanner = json['festiv_banner'];
    validity = json['validity'];
    trainerId = json['trainer_id'];
    trainerName = json['trainer_name'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plan_uid'] = planUid;
    data['plan_name'] = planName;
    data['plan_price'] = planPrice;
    data['tax_percentage'] = taxPercentage;
    data['plan_type'] = planType;
    data['duration'] = duration;
    data['is_recomended'] = isRecomended;
    data['description'] = description;
    data['original_price'] = originalPrice;
    data['is_goal'] = isGoal;
    data['package_id'] = packageId;
    data['is_festiv'] = isFestiv;
    data['festiv_banner'] = festivBanner;
    data['validity'] = validity;
    data['trainer_id'] = trainerId;
    data['trainer_name'] = trainerName;
    data['images'] = images;
    return data;
  }
}
