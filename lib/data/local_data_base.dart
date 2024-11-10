import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List todoList = [];

  late Box myBox;

  // Initialize the database
  Future<void> init() async {
    myBox = await Hive.openBox("mybox"); // Open the box when needed
    if (myBox.get("TODOLIST") == null) {
      defaultList(); // Set a default list if no data exists
    } else {
      loadData(); // Load data from Hive if available
    }
  }

  void defaultList(){
    todoList = [
      ["base task", false],
      ["drink water", false]
    ];
    updateTasks();
  }

  void loadData() {
    todoList = myBox.get("TODOLIST", defaultValue: []);
  }

  bool isEmptyList(){
    return todoList.isEmpty;
  }

void updateTasks(){
    myBox.put("TODOLIST", todoList);
}
}