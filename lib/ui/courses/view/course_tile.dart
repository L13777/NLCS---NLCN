import 'package:flutter/material.dart';
import 'package:learning_app/ui/courses/course_detail_page.dart';

import '../../../models/course.dart';

class CourseTile extends StatelessWidget {
  const CourseTile(
    this.course, {
    super.key,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    // tạo thông tin hình ảnh hiển thị của 1 bài học
    return Container(
      margin: EdgeInsets.all(4),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00FFFF), Color(0xFFBF00FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(0.785398),
              stops: [0.15, 0.7],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseDetailPage(course),
                ),
              );
            },
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      width: 100,
                      height: 100,
                      course.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            // decoration: TextDecoration.none,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          // softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          course.description,

                          style: TextStyle(
                            fontSize: 15,
                            // decoration: TextDecoration.none,
                            color: Colors.white,
                            // height: 1.2,
                          ),
                          maxLines: 2,
                          // constraints.maxHeight > 40 ? 3 : null,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          course.author,
                          style: TextStyle(
                            fontSize: 15,
                            // decoration: TextDecoration.none,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print("đổi màu icon và lưu trữ");
                  },
                  icon: Icon(Icons.star_border_outlined),
                  iconSize: 30,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
