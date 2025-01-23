import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';

import '../../model/deal_of_day/get_deal_of_day_response_model.dart';

abstract class GetDealOfDayState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetDealDayInitial extends GetDealOfDayState {}

class GetDealDayLoading extends GetDealOfDayState {}

class GetDealDaySuccess extends GetDealOfDayState {
  final GetDealOfDayResponseModel getDealOfDayResponseModel;

  GetDealDaySuccess({required this.getDealOfDayResponseModel});

  @override
  List<Object?> get props => [getDealOfDayResponseModel];
}

class GetDealDayFail extends GetDealOfDayState {
  final CommonResponseModel commonResponseModel;

  GetDealDayFail({required this.commonResponseModel});

  @override
  List<Object?> get props => [commonResponseModel];
}
