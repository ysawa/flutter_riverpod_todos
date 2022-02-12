// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'todos_notifier.dart';
export 'todos_notifier.dart';

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) => TodosNotifier());
