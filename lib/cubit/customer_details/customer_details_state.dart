import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/customer/customer_details_response_model.dart';

abstract class CustomerDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCustomerDetailInitial extends CustomerDetailsState {}

class GetCustomerDetailLoading extends CustomerDetailsState {}

class GetCustomerDetailSuccess extends CustomerDetailsState {
  final CustomerDetailsResponseModel customerDetailsResponseModel;

  GetCustomerDetailSuccess({required this.customerDetailsResponseModel});

  @override
  List<Object> get props => [customerDetailsResponseModel];
}

class GetCustomerDetailFail extends CustomerDetailsState {
  final CommonResponseModel commonResponseModel;

  GetCustomerDetailFail({required this.commonResponseModel});

  @override
  List<Object> get props => [commonResponseModel];
}
