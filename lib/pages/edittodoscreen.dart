import 'package:flutter/material.dart';
import 'package:to_do/model/todo.dart';
import 'package:to_do/widgets/todoform.dart';
import 'package:to_do/widgets/todowidget.dart';

class EditTodoScreen extends StatefulWidget {
  const EditTodoScreen({Key? key}) : super(key: key);

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late String title;
  late String description;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // title = widget.todo.title;
    //description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Edit Todo')),
        body: ToDoFormWidget(
          onChangedTitle: (title) => setState(() {
            this.title = title;
          }),
          onChangedDescription: (description) => setState(() {
            this.description = description;
          }),
          onSavedTodo: () {},
        ));
  }
}
