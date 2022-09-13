import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/model/todo.dart';
import 'package:to_do/provider/todos.dart';

import 'todoform.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formkey = GlobalKey<FormState>();

  String title = '';
  String description = '';
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   title = widget.todo.title;
  //   description = widget.todo.description;
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add ToDo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 8,
            ),
            ToDoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTodo: addTodo)
          ],
        ),
      ),
    );
  }

  void addTodo() {
    final isValid = _formkey.currentState?.validate();
    final todo;
    if (!isValid!) {
      return;
    } else {
      todo = Todo(
          createdTime: DateTime.now(),
          description: description,
          title: title,
          id: DateTime.now().toString());
    }
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.addTodo(todo);
    Navigator.of(context).pop();
  }
}
