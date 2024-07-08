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
      body: Container(
        height: 120,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: course.imageUrl.isNotEmpty
                ? NetworkImage(
                    'https://th.bing.com/th/id/OIG3.FWWgOw5WVrFMYEyGCag1?pid=ImgGn',
                  )
                : AssetImage(course.imageUrl) as ImageProvider<Object>,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
