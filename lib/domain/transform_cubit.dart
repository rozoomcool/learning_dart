import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesboard/domain/states/transform_state.dart';

class TransformCubit extends Cubit<TransformState>{
  TransformCubit() : super(TransformState(0, 0, 1));

  void updateOffset(double x, double y) {
    emit(state.updateOffset(x, y));
  }

  void updateScale(double value) {
    if(state.scale > 2.5){
      emit(TransformState(state.offsetX, state.offsetY, 2.5));
    } else if(state.scale  < 0.5){
      emit(TransformState(state.offsetX, state.offsetY, 0.5));
    }else{
      emit(TransformState(state.offsetX, state.offsetY, state.scale + (value - 1)* 0.025));
    }
  }
}