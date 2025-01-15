import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/sport/get_sport_response_model.dart';

abstract class GetSportsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSportInitial extends  GetSportsState{}

class GetSportLoading extends GetSportsState {}

class GetSportSuccess extends GetSportsState {
  final GetSportsResponseModel getSportsResponseModel;

  GetSportSuccess({required this.getSportsResponseModel});

  @override
  List<Object?> get props => [getSportsResponseModel];
}

class GetSportFail extends GetSportsState {
  final CommonResponseModel commonResponseModel;

  GetSportFail({required this.commonResponseModel});
}
