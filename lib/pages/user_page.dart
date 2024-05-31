import 'package:flutter/material.dart';
import 'package:learning_app/models/user.dart';
import 'package:learning_app/ui/users/users_manager.dart';
import 'package:learning_app/ui/users/view/users_tile.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usersManager = UsersManager();
    final List<User> users = usersManager.accounts;

    if (users.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: Center(
          child: Text('No users available'),
        ),
      );
    }

    final User user = users
        .first; // Lấy người dùng đầu tiên hoặc thay đổi logic để lấy người dùng cụ thể

    return UserTile(user);
  }
}
