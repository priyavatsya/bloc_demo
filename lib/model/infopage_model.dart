import 'dart:convert';

class InfoPageModel {
  final String name;
  final String job;
  final String id;
  final String createdAt;

  InfoPageModel(
      this.name,
      this.job,
      this.id,
      this.createdAt,
      );

  InfoPageModel copyWith({
    String? name,
    String? job,
    String? id,
    String? createdAt,
  }) {
    return InfoPageModel(
      name ?? this.name,
      job ?? this.job,
      id ?? this.id,
      createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'job': job,
      'id': id,
      'createdAt': createdAt,
    };
  }

  factory InfoPageModel.fromMap(Map<String, dynamic> map) {
    return InfoPageModel(
      map['name'] ?? '',
      map['job'] ?? '',
      map['id'] ?? '',
      map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoPageModel.fromJson(String source) =>
      InfoPageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InfoPageModel(name: $name, job: $job, id: $id, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InfoPageModel &&
        other.name == name &&
        other.job == job &&
        other.id == id &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^ job.hashCode ^ id.hashCode ^ createdAt.hashCode;
  }
}