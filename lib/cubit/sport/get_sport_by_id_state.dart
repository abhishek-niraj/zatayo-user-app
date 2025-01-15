import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';

import '../../model/sport/get_sports_response_model_by_sport_id.dart';

abstract class GetSportBySportIdState extends  Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetSportBySportIdInitial extends GetSportBySportIdState{

}

class GetSportBySportIdLoading extends GetSportBySportIdState{

}
class GetSportBySportIdSuccess extends GetSportBySportIdState{
  final GetSportsResponseModelBySportId getSportsResponseModelBySportId;
  GetSportBySportIdSuccess({
    required this.getSportsResponseModelBySportId
});
  @override
  // TODO: implement props
  List<Object?> get props => [getSportsResponseModelBySportId];
}
class GetSportBySportIdFail extends GetSportBySportIdState{
  final CommonResponseModel commonResponseModel;
  GetSportBySportIdFail({
    required this.commonResponseModel
});
  @override
  // TODO: implement props
  List<Object?> get props => [commonResponseModel];
}
