import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/model/customer/customer_basic_information_model.dart';

class CustomerBasicInformationCubit
    extends Cubit<CustomerBasicInformationModel> {
  CustomerBasicInformationCubit() : super(CustomerBasicInformationModel());

  void updateModel({String? customerName, String? customerId}) {
    emit(state.copyWith(
        customerName: customerName ?? state.customerName,
        customerId: customerId ?? state.customerId));
  }

  void clearAllData() {
    emit(CustomerBasicInformationModel());
  }
}
