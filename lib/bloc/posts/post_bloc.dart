import 'package:counter_bloc/bloc/posts/posts_state.dart';
import 'package:counter_bloc/bloc/posts/posts_events.dart';
import 'package:counter_bloc/repositories/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Bloc<PostsEvents, PostsState> {
  final PostRepository _postRepository = PostRepository();
  PostsBloc() : super(PostsState()) {
    on<PostsFetched>(_fetchPosts);
  }

  Future<void> _fetchPosts(PostsEvents event, Emitter<PostsState> emit) async {
    try {
      final posts = await _postRepository.fetch();
      emit(state.copyWith(posts: posts, status: PostsResultState.success));
    } catch (e) {
      emit(
        state.copyWith(status: PostsResultState.error, message: e.toString()),
      );
    }
  }
}
