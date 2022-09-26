import 'dart:convert';

import 'package:gymnotes/api/firestore_api.dart';
import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/models/application_models.dart';

class PlansService {

  final FirestoreApi _firestoreApi = locator<FirestoreApi>();

  Future<List<TPlan>> getPlans() async {
    final List<Map<String, String>> templateJsonStrings = await _firestoreApi.getPlanTemplates();

    List<TPlan> plans = [];

    for (Map<String, String> templateJsonString in templateJsonStrings) {
      plans.add(TPlan.fromJson(
        templateJsonString['id']!,
        jsonDecode(templateJsonString['template']!)
      ));
    }

    return plans;
  }

  Future<TPlan> getCurrentPlan() async {
    var plans = await getPlans();
    return plans.firstWhere((element) => element.current);
  }

  Future<TPlan> createPlan(TPlanDto planDto) async {

    print(planDto.toJson());
    
    String id = await _firestoreApi.storePlanTemplate(templateJsonString: jsonEncode(planDto.toJson()));

    return TPlan(
      id: id,
      name: planDto.name,
      current: planDto.current,
      workouts: planDto.workouts,
    );
  }

  Future<void> updatePlan(TPlan plan) async {
    TPlanDto planDto = TPlan.toTPlanDto(plan);
    _firestoreApi.updatePlanTemplate(planTemplateId: plan.id, templateJsonString: jsonEncode(planDto.toJson()));
  }
}