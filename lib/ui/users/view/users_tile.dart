import 'package:flutter/material.dart';
import 'package:learning_app/models/user.dart';

class UserTile extends StatelessWidget {
  const UserTile(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: user.bgImageUrl.isNotEmpty
                    ? NetworkImage(
                        'https://th.bing.com/th/id/OIG3.FWWgOw5WVrFMYEyGCag1?pid=ImgGn',
                      )
                    : AssetImage(user.bgImageUrl) as ImageProvider<Object>,
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.transparent,
                  // color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: user.avatarImageUrl.isNotEmpty
                          ? NetworkImage(
                              'https://th.bing.com/th/id/OIG3.FWWgOw5WVrFMYEyGCag1?pid=ImgGn',
                            )
                          : AssetImage('assets/images/UDBG2.jpg'
                              // user.avatarImageUrl
                              ) as ImageProvider<Object>,
                    ),
                  ),
                ),
                Text(
                  user.name,
                  style: TextStyle(color: Colors.white),
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
