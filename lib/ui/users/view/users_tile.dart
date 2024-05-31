import 'package:flutter/material.dart';
import 'package:learning_app/models/user.dart';

class UserTile extends StatelessWidget {
  const UserTile(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    final String backgroundUrl = user.bgImageUrl.isNotEmpty
        ? user.bgImageUrl
        : 'https://th.bing.com/th/id/OIG3.FWWgOw5WVrFMYEyGCag1?pid=ImgGn';
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  backgroundUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            user.avatarImageUrl.isNotEmpty
                                ? user.avatarImageUrl
                                : 'https://th.bing.com/th/id/OIG3.FWWgOw5WVrFMYEyGCag1?pid=ImgGn',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text('Các khoá học'),
              Text('Thời khoá biểu'),
            ],
          ),
        ],
      ),
    );
  }
}
