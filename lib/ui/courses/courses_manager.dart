import 'package:flutter/material.dart';

import '../../models/course.dart';

class CoursesManager {
  // khai báo giá trị
  final List<Course> _items = [
    Course(
      id: 't1',
      title: 'Lập trình căn bản',
      description: 'khoá học cho người mới bắt đầu',
      imageUrl: 'https://th.bing.com/th/id/OIG3.FWWgOw5WVrFMYEyGCag1?pid=ImgGn',
      author: 'Nguyễn Công Danh',
      isBookMarked: true,
      duration: 2,
      daysOfWeek: [1, 3, 5],
      startTime: TimeOfDay(hour: 7, minute: 0),
      endTime: TimeOfDay(hour: 9, minute: 10),
    ),
    Course(
      id: 't2',
      title: 'Lập trình hướng đối tượng',
      description: 'khoá học tìm hiểu chuyên sâu về hướng đối tượng',
      imageUrl: 'https://th.bing.com/th/id/OIG3.FWWgOw5WVrFMYEyGCag1?pid=ImgGn',
      author: 'Huy',
      isBookMarked: false,
      duration: 3,
      daysOfWeek: [2, 4],
      startTime: TimeOfDay(hour: 7, minute: 00),
      endTime: TimeOfDay(hour: 9, minute: 10),
    ),
    Course(
      id: 't3',
      title: 'Phân tích và thiết kế thuật toán',
      description: 'khoá học tối ưu hoá các thuật toán và giải thuật',
      imageUrl: 'https://th.bing.com/th/id/OIG3.FWWgOw5WVrFMYEyGCag1?pid=ImgGn',
      author: 'Trăm',
      isBookMarked: false,
      duration: 3,
      daysOfWeek: [3, 5],
      startTime: TimeOfDay(hour: 7, minute: 40),
      endTime: TimeOfDay(hour: 10, minute: 00),
    ),
    Course(
      id: 't4',
      title: 'Cấu trúc dữ liệu',
      description: 'khoá học nghiên cứu về dữ liệu',
      imageUrl: 'https://th.bing.com/th/id/OIG3.FWWgOw5WVrFMYEyGCag1?pid=ImgGn',
      author: 'Dung',
      isBookMarked: false,
      duration: 3,
      daysOfWeek: [2, 4],
      startTime: TimeOfDay(hour: 7, minute: 40),
      endTime: TimeOfDay(hour: 10, minute: 00),
    ),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Course> get items {
    return [..._items];
  }

  List<Course> get isBookMarkedItems {
    return _items.where((item) => item.isBookMarked).toList();
  }
}
