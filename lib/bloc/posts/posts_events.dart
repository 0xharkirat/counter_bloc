import 'package:equatable/equatable.dart';

abstract class PostsEvents extends Equatable {
  const PostsEvents();
}

class PostsFetched extends PostsEvents {
  @override
  List<Object?> get props => [];
}
