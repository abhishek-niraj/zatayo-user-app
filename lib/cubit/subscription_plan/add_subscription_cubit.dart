import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/subscription_plan/add_subscription_plan_cubit_model.dart';

class AddSubscriptionCubit extends Cubit<AddSubscriptionPlanCubitModel> {
  AddSubscriptionCubit() : super(AddSubscriptionPlanCubitModel());

  void updateModel({
    String? subscriptionId,
    String? inputPrice,
    String? planFor,
  }) {
    emit(state.copyWith(
        subscriptionId: subscriptionId ?? state.subscriptionId,
        inputPrice: inputPrice ?? state.inputPrice,
        planFor: planFor ?? state.planFor));
  }

  void clear() {
    emit(AddSubscriptionPlanCubitModel());
  }
}
