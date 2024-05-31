import 'package:flutter/material.dart';
import 'package:learning_app/ui/courses/courses_manager.dart';
import 'package:learning_app/ui/courses/view/course_tile.dart';

class CourseList extends StatelessWidget {
  final bool showBookMarked;

  const CourseList(this.showBookMarked, {super.key});

  @override
  Widget build(BuildContext context) {
    final coursesManager = CoursesManager();
    final courses = showBookMarked
        ? coursesManager.isBookMarkedItems
        : coursesManager.items;

    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseTile(courses[index]);
        },
        scrollDirection: Axis.vertical, // chỉnh sửa hướng xem
        padding: EdgeInsets.only(right: 5),
      ),
    );
  }
}
