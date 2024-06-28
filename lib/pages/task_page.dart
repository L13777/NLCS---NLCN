import 'package:flutter/material.dart';
import 'package:learning_app/ui/tasks/task_manager.dart';
import 'package:learning_app/ui/tasks/view/task_tile.dart';

import '../ui/tasks/view/dialogbox.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _controller = TextEditingController();
  final TaskManager taskManager = TaskManager();

  // function to change checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      taskManager.checkTask(index);
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      taskManager.addTask(_controller.text);
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
      taskManager.deleteTask(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = taskManager.tasks;
    return Scaffold(
      appBar: AppBar(
        title: Text('Work you need to do'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          /* làm cách bấm vào xem chi tiết 
          hoặc 1 dòng mô tả chi tiết ở dưới để biết công việc thực hiện */
          return TaskTile(
            task: tasks[index],
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
