import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/ApiClient/api_client.dart';
import 'package:zatayo/bloc/user_profile/user_profile_event.dart';
import 'package:zatayo/bloc/user_profile/user_profile_state.dart';

import '../../model/common_response_model.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final ApiClient apiClient = ApiClient();

  UserProfileBloc() : super(UpdateUserProfileInitial()) {
    on<UpdateUserProfile>((event, emit) async {
      emit(UpdateUserProfileLoading());
      try {
        final responseMap = await apiClient.formData("/customer/updateDetails",
            event.bodyRequest, event.image ?? Uint8List(0));

        if (responseMap.statusCode == 200) {
          final Map<String, dynamic> responseData =
              json.decode(responseMap.data);
          if (responseData['statusCode'] == 200) {
            emit(UpdateUserProfileSuccess(
                commonResponseModel: responseMap.data));
          } else {
            emit(UpdateUserProfileFail(commonResponseModel: responseMap.data));
          }
        } else {
          emit(UpdateUserProfileFail(commonResponseModel: responseMap.data));
        }
      } catch (err) {
        emit(UpdateUserProfileFail(
            commonResponseModel: CommonResponseModel(
                statusCode: 400, message: "Something went wrong")));
      }
    });
  }
}
