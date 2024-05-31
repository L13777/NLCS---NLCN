import '../../models/user.dart';

class UsersManager {
  final List<User> _accounts = [
    User(
      name: 'Linh',
      description: 'A newbie learn Information Technology',
      avatarImageUrl: '',
      bgImageUrl: '',
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
