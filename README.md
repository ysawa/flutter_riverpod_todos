# todos

## @freezedクラス

@immutableクラスを定義するのに便利なのが、 `freezed` パッケージです。

### 更新方法

`*.dart` のプロパティを変更するなどして編集してください。
（ `*.freezed.dart` ではないので注意してください。）

そして、次のシェルコマンドを実行します。

```bash
flutter pub run build_runner build
```

### 新規作成

`todo.dart` のような命名で次のようなコードを定義します。
（ `todo.freezed.dart` という命名ではないので注意してください。）

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  factory Todo(
      {required int id,
      required String description,
      required bool completed}) = _Todo;
}
```

そして、次のシェルコマンドを実行します。

```bash
flutter pub run build_runner build
```
