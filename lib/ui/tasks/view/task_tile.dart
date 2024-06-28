import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../models/task.dart';

class TaskTile extends StatelessWidget {
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  // const
  TaskTile({
    super.key,
    required this.onChanged,
    required this.deleteFunction,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: GestureDetector(
        onTap: () {
          onChanged?.call(!task.isCompleted);
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
              gradient: LinearGradient(
                colors: [Color(0xFF00FFFF), Color(0xFFBF00FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform:
                    GradientRotation(0.785398), // cho hướng xéo xéo / 45deg
                stops: [0.15, 0.7],
                /* 1.0 là 100%, cáo đầu là màu đầu bắt đầu từ đâu */
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                width: 270,
                child: Text(
                  // (phiếu đánh giá, phiếu giao việc, phiếu giới thiệu kèm vô báo cáo ghi họ tên sinh viên, mssv,) phiếu theo dõi, phiếu chấm điểm là bí mật
                  task.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: task.isCompleted ? 2 : null,
                    decorationColor: task.isCompleted ? Colors.white : null,
                  ),
                ),
              ),
              Checkbox(
                value: task.isCompleted,
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
