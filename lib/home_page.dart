import 'package:demo/util/dialog_box.dart';
import 'package:demo/util/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/local_data_base.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    db.init();
    super.initState();
  }


  void onBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateTasks();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([textController.text, false]);
      textController.clear();
    });
    db.updateTasks();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            textController: textController,
            onSave: () {
              if (textController.text.isNotEmpty) {
                saveNewTask();
                closAlertDialog();
              }
            },
            onCancel: () {
              closAlertDialog();
            },
          );
        });
  }

  void closAlertDialog() {
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
                isCompleted: db.todoList[index][1],
                taskName: db.todoList[index][0],
                onChanged: (value) => onBoxChanged(value, index),
                onDeleteTask: (context) => deleteTask(index));
          }),
    );
  }
}
