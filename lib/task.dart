import 'package:flutter/material.dart';

import 'class.dart';

class Tasks extends StatelessWidget {
  final Todo todo;

  final ValueSetter<Todo> onCompleate;
  final ValueSetter<Todo> onDelete;

  const Tasks({
    Key? key,
    required this.onCompleate,
    required this.todo,
    required this.onDelete,
  }) : super(key: key);

  void showPopup(BuildContext context, Todo todo) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        onDelete(todo);
      },
    );

    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Delete"),
      content: const Text("Are you sure."),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        leading: IconButton(
          onPressed: () => onCompleate(todo),
          icon: todo.isDone
              ? const Icon(Icons.check_circle, color: Color(0xFF3D9556))
              : const Icon(Icons.circle_outlined, color: Color(0xFF898D8A)),
        ),
        title: Text(
          todo.todoText ?? '',
          style: todo.isDone
              ? TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 18,
                  color: Colors.grey[500])
              : const TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 20, 20, 20)),
        ),
        trailing: SizedBox(
          height: 30,
          width: 30,
          child: IconButton(
            onPressed: () => showPopup(context, todo),
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xF1505AB6),
            ),
          ),
        ),
        tileColor: Colors.white,
      ),
    );
  }
}
