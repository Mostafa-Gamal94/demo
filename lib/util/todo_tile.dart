import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final bool isCompleted;
  final String taskName;
  Function(bool?) onChanged;
  Function(BuildContext)? onDeleteTask;

  TodoTile(
      {super.key,
      required this.isCompleted,
      required this.taskName,
      required this.onChanged,
      required this.onDeleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
        child: Slidable(
            endActionPane: ActionPane(motion: StretchMotion(),
                children: [
              SlidableAction(
                onPressed: onDeleteTask,
                backgroundColor: Colors.red.shade500,
                icon: Icons.delete,
                label: "Delete Task",
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              )
            ]),
            child: Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Row(
                  children: [
                    Checkbox(
                      value: isCompleted,
                      onChanged: onChanged,
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                    ),
                    Text(
                      taskName,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                ))));
  }
}
