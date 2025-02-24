
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/scann_bar_code/scan_bar_code_state.dart';
import 'package:zatayo/model/common_response_model.dart';

import '../../ApiClient/api_client.dart';

class ScanBarCodeCubit extends Cubit<ScanBarCodeState> {
  final ApiClient apiClient;
  CommonResponseModel commonResponseModel = CommonResponseModel();

  ScanBarCodeCubit(this.apiClient) : super(ScanBarCodeInitial());

  Future<void> scanBarCode(bodyRequest) async {
    emit(ScanBarCodeLoading());
    try {
      final response = await apiClient.apiCall(
        apiEndPoint: '/timeSheet/scanQr', // Example API endpoint
        data: bodyRequest
      );
      if (response.statusCode == 200) {

        print(response);
        // getSportsResponseModel = GetSportsResponseModel.fromJson(response.data);
        //
        // if (!kReleaseMode) {
        //   if (kDebugMode) {
        //     print(getSportsResponseModel.toJson());
        //   }
        // }

        if (commonResponseModel.statusCode == 200) {
          emit(ScanBarCodeSuccess(commonResponseModel: commonResponseModel));
        } else {
          final sportResponse = CommonResponseModel.fromJson(response.data);
          emit(ScanBarCodeFail(commonResponseModel: sportResponse));
        }
      } else {
        emit(
          ScanBarCodeFail(
            commonResponseModel: CommonResponseModel(
                statusCode: 400, message: "Something went wrong"),
          ),
        );
      }
    } catch (e) {
      if (!kReleaseMode) {
        if (kDebugMode) {
          print(e);
        }
      }
      emit(
        ScanBarCodeFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
