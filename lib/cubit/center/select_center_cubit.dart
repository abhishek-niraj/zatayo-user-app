import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/model/center/selcet_center_cubit_model.dart';

class SelectCenterCubit extends Cubit<SelectCenterCubitModel> {
  SelectCenterCubit() : super(SelectCenterCubitModel());

  void selectCenter({
    String? centerName,
    String? sportId,
  }) {
    emit(state.copyWith(
        centerName: centerName ?? state.centerName,
        sportId: sportId ?? state.sportId));
  }

  void clearSelectedCenter() {
    emit(SelectCenterCubitModel());
  }
}
