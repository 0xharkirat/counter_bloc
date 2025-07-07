import 'package:counter_bloc/models/posts/post_model.dart';
import 'package:equatable/equatable.dart';

// https://jsonplaceholder.typicode.com/posts
enum PostsResultState { loading, success, error }

class PostsState extends Equatable {
  final List<PostModel> posts;

  final PostsResultState status;
  final String? message;

  const PostsState( { this.posts = const [],  this.status = PostsResultState.loading,  this.message});

  PostsState copyWith({List<PostModel>? posts, PostsResultState? status, String? message}) {
    return PostsState(
      posts: posts ?? this.posts,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [posts, status, message];
}
