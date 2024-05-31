import 'package:flutter/material.dart';
import 'package:learning_app/models/user.dart';
import 'package:learning_app/ui/users/users_manager.dart';
import 'package:learning_app/ui/users/view/users_tile.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usersmanager = UsersManager();
    final List<User> user = usersmanager.accounts;
    return UserTile(user as User);
  }
}
