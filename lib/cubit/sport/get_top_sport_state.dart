import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';

import '../../model/sport/get_sports_response_model_by_sport_id.dart';

abstract class GetTopSportState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetTopSportInitial extends GetTopSportState{

}
class GetTopSportLoading extends GetTopSportState{

}
class GetTopSportSuccess extends GetTopSportState{
  final GetSportsResponseModelBySportId getSportsResponseModelBySportId;
  GetTopSportSuccess({
    required this.getSportsResponseModelBySportId
  });
  @override
  // TODO: implement props
  List<Object?> get props => [getSportsResponseModelBySportId];
}
class GetTopSportFail extends GetTopSportState{
 final  CommonResponseModel commonResponseModel;
 GetTopSportFail({
   required this.commonResponseModel
});
 @override
  // TODO: implement props
  List<Object?> get props => [commonResponseModel];
}