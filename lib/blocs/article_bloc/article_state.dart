import 'package:miniblog/models/blog.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticlesLoaded extends ArticleState {
  final List<Blog> blogs;

  ArticlesLoaded({required this.blogs});
}

class ArticleError extends ArticleState {}

class PostArticleLoaded extends ArticleState {
  final bool isDone;

  PostArticleLoaded({required this.isDone});
}
