import 'package:flutter/material.dart';

import '../model/board_model.dart';
import '../model/task_model.dart';

class BoardsProvider extends ChangeNotifier {
  double scale = 1;
  double offsetX = 0;
  double offsetY = 0;

  List<BoardModel> boards = [
    BoardModel(title: "Job", tasks: [
      TaskModel(title: 'Project1', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
      TaskModel(title: 'Hotel design', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
      TaskModel(title: 'Marry\'s house', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),

    ]),
    BoardModel(title: "Programming", tasks: [
      TaskModel(title: 'Python', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
      TaskModel(title: 'Data sience', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
      TaskModel(title: 'Django framework', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),

    ]),
    BoardModel(title: "Programming", tasks: [
      TaskModel(title: 'Python', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
      TaskModel(title: 'Data sience', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
      TaskModel(title: 'Django framework', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),

    ]),
    BoardModel(title: "Programming", tasks: [
      TaskModel(title: 'Python', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
      TaskModel(title: 'Data sience', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
      TaskModel(title: 'Django framework', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),

    ]),
    BoardModel(title: "Programming", tasks: [
      TaskModel(title: 'Python', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
      TaskModel(title: 'Data sience', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
      TaskModel(title: 'Django framework', task: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),

    ]),
  ];

  void addBoard(BoardModel board){
    boards.add(board);
    notifyListeners();
  }

  void updateScale(double s) {
    scale *= s;
    if (scale > 2) {
      scale = 2;
    }
    if (scale < 0.5) {
      scale = 0.5;
    }
    notifyListeners();
  }
}
