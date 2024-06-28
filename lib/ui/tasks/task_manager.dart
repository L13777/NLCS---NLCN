import '../../models/task.dart';

class TaskManager {
  final List<Task> _tasks = [
    Task(
      name: "Đặt câu hỏi",
      description:
          "làm rõ mọi vấn đề thông qua đặt câu hỏi thay vì cứ theo suy nghĩ",
      isCompleted: false,
    ),
    Task(
      name: "Làm phong phú cuộc sống",
      description:
          "thử công thức mới, đi một con đường khác, làm một thứ mới từ youtube, tối ưu hoá UI/UX cái này, chỉnh sửa làm sao có thể chọn hình ảnh mong muốn cho riêng mọi task",
      isCompleted: false,
    ),
    Task(
      name: "Học hỏi và áp dụng những điều mới",
      description:
          "tìm những cách làm socket và áp dụng vào cái này, cách làm bình luận, hiển thị chi tiết các thông tin trong cái này, thêm âm nhạc, nhạc nền, tố cáo và quản lý các bình luận",
      isCompleted: false,
    ),
    Task(
      name: "Nâng cao sức mạnh tinh thần",
      description:
          "àng thử thách bản thân,càng trở nên thông minh hơn bằng cách vượt qua giới hạn nhờ việc cố gắng dành ít nhất 30 phút mỗi ngày để học một kỹ năng mới hoặc nghiên cứu một chủ đề xa lạ.",
      isCompleted: false,
    ),
    Task(
      name: "Phát triển sở thích có ích",
      description:
          "Hãy tìm hiểu và làm những sở thích như viết lách, chơi nhạc cụ, vẽ tranh, đan lát, làm mộc, làm vườn...  thay vì thời gian chơi game",
      isCompleted: false,
    ),
    Task(
      name: "Tập thể dục, Phát triển thói quen sinh hoạt tốt",
      description:
          "Tập thể dục giúp cải thiện sức khỏe tổng thể, cải thiện trí nhớ, khả năng học tập, tập trung và hiểu biết. Giữ sức khỏe giúp tiết kiệm chi phí y tế  và là cách tốt nhất để tiết kiệm tiền.",
      isCompleted: false,
    ),
    Task(
      name: "Dành chút thời gian yên tĩnh",
      description:
          "Dành thời gian để suy ngẫm về cuộc sống của mình . Những người thông minh học hỏi từ kinh nghiệm của mình, để họ không mắc phải những sai lầm tương tự.",
      isCompleted: false,
    ),
    Task(
      name: "Đặt mục tiêu cụ thể",
      description:
          "Đặt rõ mục tiêu, càng cụ thể càng tốt. Thay vì đưa ra tuyên bố chung chung như "
          "tôi muốn ngủ nhiều hơn"
          ", "
          "tôi cần giảm cân"
          ", họ sẽ vạch ra: "
          "tôi ngủ lúc 21h30 mỗi ngày, bắt đầu từ hôm nay"
          " hay "
          " tôi sẽ giảm 10 kg bằng cách ăn salad vào buổi trưa, đi bộ sau bữa tối.",
      isCompleted: false,
    ),
    Task(
      name: "Sử dụng thời gian hiệu quả",
      description:
          "Một ngày có 24 giờ, đồng nghĩa 1.440 phút. Người thành công luôn nắm rõ con số ấy và nỗ lực lãng phí càng ít phút càng tốt",
      isCompleted: false,
    ),
    Task(
      name: "Mang theo sổ ghi chép, viết nhật ký",
      description:
          "Jack Dorsey - lập trình viên máy tính, doanh nhân người Mỹ, đồng sáng lập Twitter - từng nói: "
          "Hãy tìm một cách đơn giản để theo dõi sự tiến bộ bản thân. Bạn có thể thấy mình đã phát triển thế nào, kinh doanh thăng tiến và khả năng lãnh đạo được cải thiện ra sao"
          ".",
      isCompleted: false,
    ),
    Task(
      name: "Xác định ước mơ và nâng cao khả năng hành động",
      description:
          "Ước mơ không cần phải vĩ đại, chúng là động lực và ý nghĩa của cuộc sống. Chúng ta không cần có tham vọng lớn như người sáng lập SpaceX Musk, nhưng nên nỗ lực hết mình để hiện thực hóa những mong muốn nhỏ bé.",
      isCompleted: false,
    ),
    Task(
      name: "Đối xử với bản thân tốt hơn",
      description:
          "Hãy làm điều gì đó cho bản thân mỗi ngày, mỗi tháng, mỗi năm. Hãy để tiếng nói nội tâm trở thành một người bạn và ủng hộ bạn, chứ không phải một nhà phê bình gay gắt.",
      isCompleted: false,
    ),
    Task(
      name: "",
      description: "",
      isCompleted: false,
    ),
  ];

  int get taskCount {
    return _tasks.length;
  }

  List<Task> get tasks {
    return [..._tasks];
  }

  // Hàm để checkbox
  void checkTask(int index) {
    _tasks[index] =
        _tasks[index].copyWith(isCompleted: !_tasks[index].isCompleted);
  }

  // Hàm thêm task
  void addTask(String name) {
    _tasks.add(Task(name: name, description: ""));
  }

  // Hàm xoá task
  void deleteTask(int index) {
    _tasks.removeAt(index);
  }
}
