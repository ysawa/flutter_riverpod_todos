import 'package:flutter/foundation.dart';

@immutable
class Todo {
  const Todo(
      {required this.id, required this.description, required this.completed});

  // All properties should be `final` on our class.
  final int id;
  final String description;
  final bool completed;

  // Since Todo is immutable, we implement a method that allows cloning the
  // Todo with slightly different content.
  Todo copyWith({int? id, String? description, bool? completed}) => Todo(
        id: id ?? this.id,
        description: description ?? this.description,
        completed: completed ?? this.completed,
      );
}
