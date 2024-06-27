import 'package:flutter/material.dart';

import '../../../util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;

  // const
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSaved,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 198, 167, 251),
      content: Container(
        padding: EdgeInsets.all(5),
        height: 130,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),

            //button to save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: "Save", onPressed: onSaved),
                const SizedBox(
                  width: 8,
                ),
                Button(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
