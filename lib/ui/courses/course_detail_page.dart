import 'package:flutter/material.dart';
import 'package:learning_app/models/course.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage(this.course, {super.key});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Text('Đây là hiển thị chi tiết'),
    );
  }
}
