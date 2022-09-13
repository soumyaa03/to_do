class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;
  Todo(
      {required this.createdTime,
      this.description = '',
      this.id = '',
      this.isDone = false,
      required this.title});
}
