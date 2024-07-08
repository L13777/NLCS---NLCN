import 'package:flutter/material.dart';
import 'package:learning_app/ui/courses/view/course_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // nghĩ cách chỉnh sửa lại để có thể dùng listview cho tiện
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Lập trình căn bản',
                        style: TextStyle(
                            fontSize: 17, decoration: TextDecoration.none),
                      ),
                      Text(
                        'Xem thêm',
                        style: TextStyle(
                            fontSize: 15, decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                CourseList(false),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Lập trình hướng đối tượng',
                        style: TextStyle(
                            fontSize: 17, decoration: TextDecoration.none),
                      ),
                      Text(
                        'Xem thêm',
                        style: TextStyle(
                            fontSize: 15, decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                CourseList(false), // cần cải thiện thêm sau
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Phân tích và thiết kế thuật toán',
                        style: TextStyle(
                            fontSize: 17, decoration: TextDecoration.none),
                      ),
                      Text(
                        'Xem thêm',
                        style: TextStyle(
                            fontSize: 15, decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                CourseList(false), // cần cải thiện thêm sau
              ],
            ),
          ],
        ),
      ),
    );
  }
}
