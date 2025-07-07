import 'package:counter_bloc/bloc/posts/post_bloc.dart';
import 'package:counter_bloc/bloc/posts/posts_events.dart';
import 'package:counter_bloc/bloc/posts/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostsFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: Center(
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            switch (state.status) {
              case PostsResultState.loading:
                return CircularProgressIndicator();

              case PostsResultState.error:
                return Text("${state.message}");

              case PostsResultState.success:
                final posts = state.posts;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      title: Text(post.title),
                      leading: Text(post.id.toString()),
                      subtitle: Text(post.body),
                      trailing: Text(post.userId.toString()),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
