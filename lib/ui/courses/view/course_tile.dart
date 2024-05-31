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
      margin: EdgeInsets.only(left: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 8.0,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 120,
              child: GestureDetector(
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
                      padding: EdgeInsets.only(left: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          width: 100,
                          course.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 180,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      // color: Colors.green,
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.title,
                            style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Text(
                                style: TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                                maxLines: constraints.maxHeight > 40 ? 3 : null,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                course.description,
                              );
                            },
                          ),
                          Text(
                            course.author,
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      height: 120,
                      child: IconButton(
                        iconSize: 50,
                        color: Colors.white,
                        onPressed: () {
                          print('đổi màu icon và lưu trữ');
                        },
                        icon: Icon(
                          Icons.book_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // String dayOfWeekToString(int dayIndex) {
  //   switch (dayIndex) {
  //     case 1:
  //       return 'Thứ 2';
  //     case 2:
  //       return 'Thứ 3';
  //     case 3:
  //       return 'Thứ 4';
  //     case 4:
  //       return 'Thứ 5';
  //     case 5:
  //       return 'Thứ 6';
  //     case 6:
  //       return 'Thứ 7';
  //     case 7:
  //       return 'Chủ nhật';
  //     default:
  //       return '';
  //   }
  // }
}
