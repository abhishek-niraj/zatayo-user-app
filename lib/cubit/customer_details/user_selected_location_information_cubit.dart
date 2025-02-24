import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/model/customer/user_selected_location_information_cubit_model.dart';

class UserSelectedLocationInformationCubit
    extends Cubit<UserSelectedLocationInformationCubitModel> {
  UserSelectedLocationInformationCubit()
      : super(UserSelectedLocationInformationCubitModel());

  void updateModel(
      {String? cityName, String? stateName, String? selectedSportId}) {
    emit(
      state.copyWith(
        cityName: cityName ?? state.cityName,
        stateName: stateName ?? state.stateName,
        selectedSportId: selectedSportId ?? state.selectedSportId
      ),
    );
  }

  void clear() {
    emit(UserSelectedLocationInformationCubitModel());
  }
}
