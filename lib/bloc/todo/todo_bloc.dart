import 'package:counter_bloc/bloc/todo/todo_events.dart';
import 'package:counter_bloc/bloc/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<AddTodo>(_addTodo);
    on<DeleteTodo>(_removeTodo);
  }

  void _addTodo(AddTodo event, Emitter<TodoState> emit) {
    String body = "${event.todo} ${state.todos.length}";
    emit(state.copyWith(todos: [...state.todos, body]));
  }

  void _removeTodo(DeleteTodo event, Emitter<TodoState> emit) {
    final updatedList = List<String>.from(state.todos)..remove(event.todo);
    emit(state.copyWith(todos: updatedList));
  }
}
