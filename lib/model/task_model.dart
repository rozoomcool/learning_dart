class TaskModel {
  String question;
  List<String> options;
  int answerId;

  TaskModel(this.question, this.options, this.answerId){
    if(answerId >= question.length){
      answerId = 0;
    }
  }
}