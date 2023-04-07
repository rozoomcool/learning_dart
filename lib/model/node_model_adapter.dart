import 'package:hive/hive.dart';
import 'package:notesboard/model/node_model.dart';

class NodeModelAdapter extends TypeAdapter<NodeModel>{
  @override
  NodeModel read(BinaryReader reader) {
    return NodeModel(id: reader.read() as String, title: reader.read() as String, content: reader.read() as String, boardId: reader.read() as String, x: reader.read() as double, y: reader.read() as double);
  }

  @override
  // TODO: implement typeId
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, NodeModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.content);
    writer.write(obj.boardId);
    writer.write(obj.x);
    writer.write(obj.y);
  }

}