import 'package:test_app/model/complexity.dart';
import 'package:test_app/model/task_model.dart';
import 'package:test_app/model/test_model.dart';

class Data{
  static List<TestModel> tests = [
    TestModel(
        "Основы dart",
        [
          TaskModel("Какой это тип данных: 5?", ["String", "double", "int"], 2),
          TaskModel("Что означает конструкция if/else?", ["Тернарный опрератор", "Условная конструкция", "Модификатор доступности переменной"], 1),
          TaskModel("Что такое dart?", ["Язык программирования", "Игра с мячом", "Аниме сериал"], 0),
          TaskModel("Кого хотели заменить Dart-ом?", ["Байдена", "Обаму", "Javascript"], 2),
        ],
        Complexity.easy),
    TestModel(
        "Основы flutter",
        [
          TaskModel("Какой виджет выводит текст?: 5", ["String", "Print()", "Text()"], 2),
          TaskModel("Какой виджет отвечает за вертикальную компоновку?", ["Expanded()", "Column()", "Row()"], 1),
          TaskModel("За счет чего flutter является столь быстрым?", ["Благодаря собственному движку Skia", "Из-за продуманой системы типов", "Благодаря декларативному подходу"], 0)
        ],
        Complexity.middle),
  ];
}