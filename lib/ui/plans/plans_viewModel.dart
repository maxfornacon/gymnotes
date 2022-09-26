import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.router.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/services/plans_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PlansViewModel extends BaseViewModel {
  bool initialising = true;

  NavigationService navigationService = locator<NavigationService>();
  PlansService plansService = locator<PlansService>();

  List<TPlan> plans = [];
  bool currentPlanIsSet = false;

  Future<void> initialise() async {
    plans = await getPlans();

    for (TPlan plan in plans) {
      if (plan.current) {
        currentPlanIsSet = true;
        break;
      }
    }

    initialising = false;
    notifyListeners();
  }

  void setPlanAsCurrent(TPlan plan) async {
    for (TPlan plan in plans) {
      if (plan.current) {
        TPlan updatedPlan = plan.copyWith(current: false);
        await plansService.updatePlan(updatedPlan);
      }
    }

    TPlan updatedPlan = plan.copyWith(current: true);
    await plansService.updatePlan(updatedPlan);
    currentPlanIsSet = true;

    plans = await getPlans();

    notifyListeners();
  }

  Future<List<TPlan>> getPlans() async {
    List<TPlan> newPlans =  await plansService.getPlans();
    newPlans.sort((a, b) {
      if(b.current) {
        return 1;
      }
      return -1;
    });
    return newPlans;
  }

  Future<void> navigateToCreatePlan() async {
    TPlan plan = await navigationService.navigateTo(Routes.createPlanView);
    plans.add(plan);
    notifyListeners();
  }
}