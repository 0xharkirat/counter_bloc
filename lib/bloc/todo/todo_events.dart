import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {
  const TodoEvents();
}

class AddTodo extends TodoEvents {
  final String todo;

  const AddTodo({required this.todo});

  @override
  List<Object?> get props => [todo];
}

class DeleteTodo extends TodoEvents {
  final Object todo;

  const DeleteTodo({required this.todo});
  @override
  List<Object?> get props => [todo];
}
