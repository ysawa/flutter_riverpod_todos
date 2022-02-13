import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'todos/todos_list_view.dart';
import 'todos/todos_provider.dart';

void main() {
  runApp(
      // For widgets to be able to read providers, we need to wrap the entire
      // application in a "ProviderScope" widget.
      // This is where the state of our providers will be stored.
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const ProviderScope(
        child: _MyApp(),
      );
}

// Note: MyApp is a HookConsumerWidget, from hooks_riverpod.
class _MyApp extends HookConsumerWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
                'Completed ${todos.where((element) => element.completed).length}')),
        body: const TodosListView(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            final id = todos.length + 1;
            ref.read(todosProvider.notifier).addTodo(
                Todo(id: id, description: 'todo $id', completed: false));
          },
        ),
      ),
    );
  }
}
