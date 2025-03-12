import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';

abstract class SubscriptionPlanActivationState extends Equatable {
 @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialActivationPlan extends SubscriptionPlanActivationState{

}
class LoadingActivationPlan extends SubscriptionPlanActivationState{

}
class SuccessActivationPlan extends SubscriptionPlanActivationState{
  final  CommonResponseModel commonResponseModel;
  SuccessActivationPlan({
    required this.commonResponseModel
  });
  @override
  // TODO: implement props
  List<Object?> get props => [commonResponseModel];
}
class FailActivationPlan extends SubscriptionPlanActivationState{
 final  CommonResponseModel commonResponseModel;
 FailActivationPlan({
   required this.commonResponseModel
});
 @override
 // TODO: implement props
 List<Object?> get props => [commonResponseModel];
}