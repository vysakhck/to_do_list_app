class Todo {
  int? id;
  String? todoText;
  bool isDone;
  String category;
  String date;
  String startTime;
  String endTime;
  int remaind;
  String repeat;

  Todo({
    required this.id,
    required this.todoText,
    required this.category,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remaind,
    required this.repeat,
    this.isDone = false,
  });
}

List<Todo> todoList = [];

// static List<Todo> todoList= {
//   return [
//     ToDo(id: 1, todoText: 'Make a to-do app.', isDone: true),
//     ToDo(id: 2, todoText: 'Check emails.', isDone: true),
//     ToDo(id: 3, todoText: 'Weekly planning.', isDone: false),
//     ToDo(id: 4, todoText: 'Prepare a meeting.', isDone: false),
//     ToDo(id: 5, todoText: 'Buy groceries.', isDone: false),
//     ToDo(id: 6, todoText: 'Go party.', isDone: false),
//     ToDo(id: 7, todoText: 'Prepare dinner.', isDone: false),
//   ];
// }
