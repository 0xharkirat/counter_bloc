import 'package:counter_bloc/bloc/app_bloc_observer.dart';
import 'package:counter_bloc/bloc/counter/counter_bloc.dart';
import 'package:counter_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:counter_bloc/bloc/posts/post_bloc.dart';
import 'package:counter_bloc/bloc/switch_example/switch_bloc.dart';
import 'package:counter_bloc/bloc/todo/todo_bloc.dart';
import 'package:counter_bloc/ui/counter/counter_screen.dart';
import 'package:counter_bloc/ui/image_picker/image_picker_screen.dart';
import 'package:counter_bloc/ui/posts/posts_screen.dart';
import 'package:counter_bloc/ui/switch_example/switch_example_screen.dart';
import 'package:counter_bloc/ui/todo/todo_screen.dart';
import 'package:counter_bloc/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => PostsBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const PostsScreen(),
      ),
    );
  }
}
