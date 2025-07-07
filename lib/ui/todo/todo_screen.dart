import 'package:counter_bloc/bloc/todo/todo_bloc.dart';
import 'package:counter_bloc/bloc/todo/todo_events.dart';
import 'package:counter_bloc/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todos.isEmpty) {
            return Center(child: Text("No Todos found"));
          }

          final todos = state.todos;
          return ListView.builder(
            itemCount: todos.length,

            itemBuilder: (context, index) {
              return ListTile(
               
                title: Text(todos[index]),
                trailing: IconButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(DeleteTodo(todo: todos[index]));

                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          context.read<TodoBloc>().add(AddTodo(todo: "Id: "));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
