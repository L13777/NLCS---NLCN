import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TagTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  // const
  TagTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: GestureDetector(
        onTap: () {
          onChanged?.call(!taskCompleted);
          // tích vô checkbox khi bấm vào hình
        },
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ]),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/UDBG.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                width: 270,
                child: Text(
                  taskName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: taskCompleted ? 2 : null,
                    decorationColor: taskCompleted ? Colors.white : null,
                  ),
                ),
              ),
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Color.fromARGB(255, 198, 167, 251),
                side: const BorderSide(color: Colors.white),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
