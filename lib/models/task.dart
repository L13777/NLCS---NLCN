class Task {
  final String? tid;
  final String name;
  final String description;
  final bool isCompleted;

  Task({
    this.tid,
    required this.name,
    required this.description,
    this.isCompleted = false,
  });

  Task copyWith({
    String? tid,
    String? name,
    String? description,
    bool? isCompleted,
  }) {
    return Task(
      tid: tid ?? this.tid,
      name: name ?? this.name,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
