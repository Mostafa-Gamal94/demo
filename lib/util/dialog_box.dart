import 'package:demo/util/buttons.dart';
import 'package:flutter/material.dart';


class DialogBox extends StatelessWidget {
  final textController;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key,
    required this.textController,
  required this.onSave,
  required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow,
        content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                  controller: textController,
                  decoration: InputDecoration(border: OutlineInputBorder()
                      , hintText: "Add a new task")
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButtons(
                    text: "Save",
                    onPressed: onSave,
                  ),
                  MyButtons(
                    text: "Cancel",
                    onPressed: onCancel,
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
