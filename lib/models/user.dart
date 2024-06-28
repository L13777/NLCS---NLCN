class User {
  final String? uid;
  final String name;
  final String description;
  final String avatarImageUrl;
  final String bgImageUrl;
  final String role;

  User({
    this.uid,
    required this.name,
    required this.description,
    required this.avatarImageUrl,
    required this.bgImageUrl,
    required this.role,
  });

  User copyWith({
    String? uid,
    String? name,
    String? description,
    String? avatarImageUrl,
    String? bgImageUrl,
    String? role,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
      avatarImageUrl: avatarImageUrl ?? this.avatarImageUrl,
      bgImageUrl: bgImageUrl ?? this.bgImageUrl,
      role: role ?? this.role,
    );
  }
}
