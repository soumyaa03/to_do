import 'package:flutter/material.dart';
import 'package:to_do/main.dart';
import 'package:to_do/widgets/completedtodolistwidget.dart';

import '../widgets/addtododialog.dart';
import '../widgets/todolistwidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [const TodoListWidget(), const CompletedTodoListWidget()];
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_rounded), label: 'Todos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done_rounded,
                size: 28,
              ),
              label: 'Completed'),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddTodoDialogWidget(),
            barrierDismissible: false,
          );
        },
      ),
    );
  }
}
