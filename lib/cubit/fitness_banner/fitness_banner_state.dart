import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';

import '../../model/fitness/fitness_banner_response_model.dart';

abstract class FitnessBannerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FitnessBannerInitial extends FitnessBannerState {}

class FitnessBannerLoading extends FitnessBannerState {}

class FitnessBannerSuccess extends FitnessBannerState {
  final FitnessBannerResponseModel fitnessBannerResponseModel;

  FitnessBannerSuccess({required this.fitnessBannerResponseModel});

  @override
  List<Object?> get props => [fitnessBannerResponseModel];
}

class FitnessBannerFail extends FitnessBannerState {
  final CommonResponseModel commonResponseModel;

  FitnessBannerFail({required this.commonResponseModel});

  @override
  List<Object> get props => [commonResponseModel];
}
