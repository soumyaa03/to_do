import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/todos.dart';
import 'package:to_do/widgets/todowidget.dart';

class CompletedTodoListWidget extends StatelessWidget {
  const CompletedTodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;
    return todos.isEmpty
        ? const Center(
            child: Text(
              'No Todos',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
