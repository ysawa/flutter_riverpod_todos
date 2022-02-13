import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'todos_provider.dart';

export 'todos_provider.dart';

class TodosListView extends ConsumerWidget {
  const TodosListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    final todos = ref.watch(todosProvider);

    // Let's render the riverpod_todos in a scrollable list view
    return ListView(
      children: [
        for (final todo in todos)
          CheckboxListTile(
            value: todo.completed,
            // When tapping on the todo, change its completed status
            onChanged: (value) =>
                ref.read(todosProvider.notifier).toggle(todo.id),
            title: Text(todo.description),
          ),
      ],
    );
  }
}
