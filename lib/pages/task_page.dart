import 'package:flutter/material.dart';
import 'package:learning_app/ui/tasks/view/tag.dart';

import '../ui/tasks/view/dialogbox.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _controller = TextEditingController();

// chỉnh sửa cho giống với course và user để tối ưu hoá
  List toDoList = [
    ["Đặt câu hỏi", false],
    /* làm rõ mọi vấn đề thông qua đặt câu hỏi thay vì cứ theo suy nghĩ */
    ["Làm phong phú cuộc sống", true],
    /* thử công thức mới, đi một con đường khác,
    làm một thứ mới từ youtube, tối ưu hoá UI/UX cái này,
    chỉnh sửa làm sao có thể chọn hình ảnh mong muốn cho riêng mọi task */
    ["Học hỏi và áp dụng những điều mới", false],
    /* tìm những cách làm socket và áp dụng vào cái này,
    cách làm bình luận, hiển thị chi tiết các thông tin trong cái này,
    thêm âm nhạc, nhạc nền, tố cáo và quản lý các bình luận */
    ["Nâng cao sức mạnh tinh thần", false],
    /* càng thử thách bản thân,càng trở nên thông minh hơn
    bằng cách vượt qua giới hạn nhờ việc cố gắng dành ít nhất 30 phút mỗi ngày
     để học một kỹ năng mới hoặc nghiên cứu một chủ đề xa lạ. */
    ["Phát triển sở thích có ích", false],
    /* Hãy tìm hiểu và làm những sở thích như 
    viết lách, chơi nhạc cụ, vẽ tranh, đan lát, làm mộc, làm vườn... 
    thay vì thời gian chơi game */
    ["Tập thể dục, Phát triển thói quen sinh hoạt tốt", false],
    /* Tập thể dục giúp cải thiện sức khỏe tổng thể, cải thiện trí nhớ,
    khả năng học tập, tập trung và hiểu biết.
    Giữ sức khỏe giúp tiết kiệm chi phí y tế 
    và là cách tốt nhất để tiết kiệm tiền*/
    ["Dành chút thời gian yên tĩnh", false],
    /* Dành thời gian để suy ngẫm về cuộc sống của mình .
    Những người thông minh học hỏi từ kinh nghiệm của mình,
    để họ không mắc phải những sai lầm tương tự */
    ["Đặt mục tiêu cụ thể", false],
    /* Đặt rõ mục tiêu, càng cụ thể càng tốt.
    Thay vì đưa ra tuyên bố chung chung như "tôi muốn ngủ nhiều hơn",
    "tôi cần giảm cân", họ sẽ vạch ra: "tôi ngủ lúc 21h30 mỗi ngày,
    bắt đầu từ hôm nay" hay " tôi sẽ giảm 10 kg 
    bằng cách ăn salad vào buổi trưa, đi bộ sau bữa tối" */
    ["Sử dụng thời gian hiệu quả", false],
    /* Một ngày có 24 giờ, đồng nghĩa 1.440 phút. 
    Người thành công luôn nắm rõ con số ấy 
    và nỗ lực lãng phí càng ít phút càng tốt */
    ["Mang theo sổ ghi chép, viết nhật ký", false],
    /* Jack Dorsey - lập trình viên máy tính, doanh nhân người Mỹ,
    đồng sáng lập Twitter - từng nói: "Hãy tìm một cách đơn giản
    để theo dõi sự tiến bộ bản thân. Bạn có thể thấy mình đã phát triển thế nào,
    kinh doanh thăng tiến và khả năng lãnh đạo được cải thiện ra sao". */
    ["Xác định ước mơ và nâng cao khả năng hành động", false],
    /* Ước mơ không cần phải vĩ đại, chúng là động lực và ý nghĩa của cuộc sống.
    Chúng ta không cần có tham vọng lớn như người sáng lập SpaceX Musk,
    nhưng nên nỗ lực hết mình để hiện thực hóa những mong muốn nhỏ bé.  */
    ["", false],
    ["", false],
    ["", false],
    ["", false],
    ["", false],
    ["Đối xử với bản thân tốt hơn", false],
    /* Hãy làm điều gì đó cho bản thân mỗi ngày, mỗi tháng, mỗi năm.
    Hãy để tiếng nói nội tâm trở thành một người bạn và ủng hộ bạn,
    chứ không phải một nhà phê bình gay gắt. */
  ];

  // function to change checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // function to create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSaved: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // function to delete Task

  /* tìm cách để khi người dùng bấm xong sẽ trượt qua 
  và tự xoá ngoài ra có thể hoàn lại hành động này */
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work you need to do'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          /* làm cách bấm vào xem chi tiết 
          hoặc 1 dòng mô tả chi tiết ở dưới để biết công việc thực hiện */
          return TagTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
