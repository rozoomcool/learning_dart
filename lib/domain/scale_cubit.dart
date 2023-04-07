import 'package:flutter_bloc/flutter_bloc.dart';

class ScaleCubit extends Cubit<double>{
  ScaleCubit() : super(1);

  void updateScale(double value) {
    if(state > 3){
      emit(2);
    } else if(state < 0.5){
      emit(0.5);
    }else{
      emit(state + (value - 1)* 0.025);
    }
  }
}