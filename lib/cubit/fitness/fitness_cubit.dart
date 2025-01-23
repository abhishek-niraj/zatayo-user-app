import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/fitness/fitness_state.dart';
import 'package:zatayo/model/fitness/fitness_response_model.dart';

import '../../ApiClient/api_client.dart';
import '../../model/common_response_model.dart';

class FitnessCubit extends Cubit<FitnessState> {
  final ApiClient apiClient;

  FitnessCubit(this.apiClient) : super(GetFitnessInitial());

  Future<void> fetchFitness(city) async {
    // emit(FitnessBannerLoading());
    try {
      final response = await apiClient.apiCallGet(
        apiEndPoint: '/fitness/user/get-fitness?city= $city', // Example API endpoint
      );
       if(response.statusCode == 200){
         final fitnessResponse = FitnessResponseModel.fromJson(response.data);

         if (!kReleaseMode) {
           if (kDebugMode) {
             print(fitnessResponse.toJson());
           }
         }

         if (fitnessResponse.statusCode == 200) {
           emit(GetFitnessSuccess(fitnessResponseModel: fitnessResponse));
         } else {
           final fitnessResponse = CommonResponseModel.fromJson(response.data);
           emit(GetFitnessFail(commonResponseModel: fitnessResponse));
         }
       }else{

         emit(
           GetFitnessFail(
             commonResponseModel: CommonResponseModel(
                 statusCode: 400, message: "Something went wrong"),
           ),
         );
       }
    } catch (e) {
      if(!kReleaseMode){
        if (kDebugMode) {
          print(e);
        }
      }
      emit(
        GetFitnessFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
