import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/todos.dart';
import 'package:to_do/widgets/addtododialog.dart';

import '../model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Slidable(
      key: Key(todo.id),
      startActionPane: ActionPane(
        motion: DrawerMotion(
          key: Key(todo.id),
        ),
        children: [
          SlidableAction(
            onPressed: (_) => editTodo(context, todo),
            backgroundColor: Colors.green,
            label: 'Edit',
            icon: Icons.edit,
          ),
        ],
      ),
      endActionPane:
          ActionPane(motion: DrawerMotion(key: Key(todo.id)), children: [
        SlidableAction(
            onPressed: (_) => deleteTodo(context, todo),
            backgroundColor: Colors.red,
            label: 'Delete',
            icon: Icons.delete)
      ]),
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
              value: todo.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                final isDone = provider.TodoStatus(todo);
                if (isDone == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Todo is Completed')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Todo called back')));
                }
              },
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        todo.description,
                        style: const TextStyle(fontSize: 20, height: 1.5),
                      ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Todo is Deleted')));
  }

  editTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    return showDialog(
      context: context,
      builder: (context) => AddTodoDialogWidget(),
      barrierDismissible: false,
    );
  }
}
