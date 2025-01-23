import 'package:equatable/equatable.dart';
import 'package:zatayo/model/center/get_center_model.dart';
import 'package:zatayo/model/common_response_model.dart';

abstract class GetCenterState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCenterInitial extends GetCenterState {}

class GetCenterLoading extends GetCenterState {}

class GetCenterSuccess extends GetCenterState {
  final GetCenterResponseModel getCenterResponseModel;

  GetCenterSuccess({required this.getCenterResponseModel});

  @override
  List<Object?> get props => [getCenterResponseModel];
}

class GetCenterFail extends GetCenterState {
  final CommonResponseModel commonResponseModel;

  GetCenterFail({required this.commonResponseModel});

  @override
  List<Object?> get props => [commonResponseModel];
}
