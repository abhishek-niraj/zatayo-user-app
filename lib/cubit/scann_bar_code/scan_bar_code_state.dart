import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';

abstract class ScanBarCodeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ScanBarCodeInitial extends ScanBarCodeState {}

class ScanBarCodeLoading extends ScanBarCodeState {}

class ScanBarCodeSuccess extends ScanBarCodeState {
  final CommonResponseModel commonResponseModel;

  ScanBarCodeSuccess({required this.commonResponseModel});

  @override
  List<Object?> get props => [commonResponseModel];
}

class ScanBarCodeFail extends ScanBarCodeState {
  final CommonResponseModel commonResponseModel;

  ScanBarCodeFail({required this.commonResponseModel});

  @override
  List<Object?> get props => [commonResponseModel];
}
