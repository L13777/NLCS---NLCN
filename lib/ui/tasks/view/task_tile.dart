import 'package:flutter/material.dart';

import '../../../models/task.dart';

class TaskTile extends StatefulWidget {
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
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  double _offset = 0;

  // chỉnh sửa sao cho khi bấm vào thì nó sẽ bị đẩy ra ngoài màn hình và xoá
  void deleteTaskCompleted() {
    setState(() {
      _offset = widget.task.isCompleted ? 0 : 500;
      widget.onChanged?.call(!widget.task.isCompleted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: GestureDetector(
        onTap: () {
          widget.onChanged?.call(!widget.task.isCompleted);
          // tích vô checkbox khi bấm vào hình
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 10000),
          transform: Matrix4.translationValues(_offset, 2, 2),
          curve: Curves.easeInOut,
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
                widget.task.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  decoration: widget.task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: widget.task.isCompleted ? 2 : null,
                  decorationColor:
                      widget.task.isCompleted ? Colors.white : null,
                ),
              ),
            ),
            Checkbox(
              value: widget.task.isCompleted,
              onChanged: widget.onChanged,
              activeColor: Colors.white,
              checkColor: Color.fromARGB(255, 198, 167, 251),
              side: const BorderSide(color: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}
