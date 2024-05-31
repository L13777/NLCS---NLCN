class User {
  final String? id;
  final String name;
  final String description;
  final String avatarImageUrl;
  final String bgImageUrl;
  final String role;

  User({
    this.id,
    required this.name,
    required this.description,
    required this.avatarImageUrl,
    required this.bgImageUrl,
    required this.role,
  });

  User copyWith({
    String? id,
    String? name,
    String? description,
    String? avatarImageUrl,
    String? bgImageUrl,
    String? role,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      avatarImageUrl: avatarImageUrl ?? this.avatarImageUrl,
      bgImageUrl: bgImageUrl ?? this.bgImageUrl,
      role: role ?? this.role,
    );
  }
}
