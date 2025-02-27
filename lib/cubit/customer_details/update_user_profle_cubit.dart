
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/model/customer/update_user_profile_cubit_model.dart';

class UpdateUserProfileCubit extends Cubit<UpdateUserProfileCubitModel> {
  UpdateUserProfileCubit() : super(UpdateUserProfileCubitModel());

  void updateModel({
    String? name,
    String? dob,
    String? gender,
    String? height,
    String? weight,
    bool? isGetData,
    final Uint8List? userProfileImage
  }) {
    emit(state.copyWith(
        name: name ?? state.name,
        dob: dob ?? state.dob,
        gender: gender ?? state.gender,
        height: height ?? state.height,
        isGetData: isGetData ?? state.isGetData,
         userProfileImage: userProfileImage ?? state.userProfileImage,
    ));
  }

  clearCubitOfUpdateUserProfileCunit() {
    emit(UpdateUserProfileCubitModel());
  }
}
