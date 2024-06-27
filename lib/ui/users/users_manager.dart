import '../../models/user.dart';

class UsersManager {
  final List<User> _accounts = [
    User(
      name: 'Linh',
      description: 'A newbie learning Information Technology',
      avatarImageUrl: '',
      bgImageUrl: 'assets/images/UDBG.jpg',
      role: 'student',
    ),
  ];

  int get accountCount {
    return _accounts.length;
  }

  List<User> get accounts {
    return [..._accounts];
  }
}
