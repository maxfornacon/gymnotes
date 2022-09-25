import 'package:gymnotes/app/app.locator.dart';
import 'package:gymnotes/app/app.logger.dart';
import 'package:gymnotes/app/app.router.dart';
import 'package:gymnotes/models/application_models.dart';
import 'package:gymnotes/services/plans_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'create_plan_view.form.dart';

class CreatePlanViewModel extends FormViewModel {
  bool initialising = true;

  final log = getLogger('CreatePlanViewModel');

  NavigationService navigationService = locator<NavigationService>();
  SnackbarService snackbarService = locator<SnackbarService>();
  PlansService plansService = locator<PlansService>();

  List<TWorkout> workouts = [];

  Future<void> addWorkout() async {
    TWorkout newWorkout = await navigationService.navigateTo(Routes.addWorkoutView);
    workouts.add(newWorkout);
    notifyListeners();
  }

  Future<void> createPlan() async {
    log.i('createPlan');

    if (nameValue == null || nameValue!.isEmpty) {
      snackbarService.showSnackbar(message: 'Please enter a name');
      log.v('nameValue is null or empty');
      return;
    }

    TPlanDto planDto = TPlanDto(
      name: nameValue!,
      workouts: workouts,
      current: false,
    );

    setBusy(true);
    TPlan plan = await plansService.createPlan(planDto);
    setBusy(false);

    navigationService.back(result: plan);
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}