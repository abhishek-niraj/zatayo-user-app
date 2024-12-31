import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/fitness/fitness_response_model.dart';

abstract class FitnessState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFitnessInitial extends FitnessState {}

class GetFitnessLoading extends FitnessState {}

class GetFitnessSuccess extends FitnessState {
  final FitnessResponseModel fitnessResponseModel;

  GetFitnessSuccess({required this.fitnessResponseModel});

  @override
  List<Object?> get props => [fitnessResponseModel];
}

class GetFitnessFail extends FitnessState {
  final CommonResponseModel commonResponseModel;

  GetFitnessFail({required this.commonResponseModel});
}
