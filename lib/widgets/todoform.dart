import 'package:flutter/material.dart';

class ToDoFormWidget extends StatelessWidget {
  final String title;
  final String desc;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  const ToDoFormWidget(
      {Key? key,
      this.title = '',
      this.desc = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          const SizedBox(height: 8),
          buildDesc(),
          const SizedBox(height: 8),
          buildSaveButton()
        ],
      ),
    );
  }

  Widget buildTitle() {
    return TextFormField(
      initialValue: title,
      onChanged: onChangedTitle,
      validator: (title) {
        if (title!.isEmpty) {
          return 'The title cant be empty';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Title',
      ),
    );
  }

  Widget buildDesc() {
    return TextFormField(
      initialValue: desc,
      onChanged: onChangedDescription,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), labelText: 'Description'),
    );
  }

  Widget buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onSavedTodo,
          child: const Text('Save'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black))),
    );
  }
}
