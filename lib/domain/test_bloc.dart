import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/data.dart';
import '../model/test_model.dart';

class TestBloc extends Bloc<TestEvent, List<TestModel>>{
  TestBloc() : super(Data.tests) {
    on<TestGetEvent>(_onTestGetEvent);
    on<TestUpdateEvent>(_onTestUpdateEvent);
    on<TestIncrementDoneByTestIndex>(_onTestIncrementDoneByTestIndex);
    on<TestDoneResetByTestIndex>(_onTestDoneResetByTestIndex);
  }

  _onTestGetEvent(TestGetEvent event, Emitter<List<TestModel>> emit) {
    emit(Data.tests);
  }
  _onTestUpdateEvent(TestUpdateEvent event, Emitter<List<TestModel>> emit) {
    Data.tests = event.listOfTests;
    emit(Data.tests);
  }
  _onTestIncrementDoneByTestIndex(TestIncrementDoneByTestIndex event, Emitter<List<TestModel>> emit) {
    List<TestModel> data = Data.tests;
    data[event.index].done += 1;
    Data.tests = data;
    emit(Data.tests);
  }
  _onTestDoneResetByTestIndex(TestDoneResetByTestIndex event, Emitter<List<TestModel>> emit) {
    List<TestModel> data = Data.tests;
    data[event.index].done = 0;
    Data.tests = data;
    emit(Data.tests);
  }

}

abstract class TestEvent{}

class TestGetEvent extends TestEvent{}

class TestIncrementDoneByTestIndex extends TestEvent{
  final int index;

  TestIncrementDoneByTestIndex(this.index);
}

class TestDoneResetByTestIndex extends TestEvent{
  final int index;

  TestDoneResetByTestIndex(this.index);
}

class TestUpdateEvent extends TestEvent{
  final List<TestModel> listOfTests;

  TestUpdateEvent(this.listOfTests);
}