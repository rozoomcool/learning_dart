import 'package:hive/hive.dart';
import 'package:notesboard/model/board_model.dart';
import 'package:notesboard/model/node_model.dart';

class BoardModelAdapter extends TypeAdapter<BoardModel>{
  @override
  BoardModel read(BinaryReader reader) {
    return BoardModel(id: reader.read() as String, title: reader.read() as String);
  }

  @override
  // TODO: implement typeId
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, BoardModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
  }

}