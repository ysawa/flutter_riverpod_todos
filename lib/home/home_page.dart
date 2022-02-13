import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../todos/todos_list_view.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Completed ${todos.where((element) => element.completed).length}')),
      body: const TodosListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final id = todos.length + 1;
          ref
              .read(todosProvider.notifier)
              .addTodo(Todo(id: id, description: 'todo $id', completed: false));
        },
      ),
    );
  }
}
