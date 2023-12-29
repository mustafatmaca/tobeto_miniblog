import 'package:miniblog/models/blog.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticlesLoading extends ArticleState {}

class ArticlesLoaded extends ArticleState {
  final List<Blog> blogs;

  ArticlesLoaded({required this.blogs});
}

class ArticlesError extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final Blog blog;

  ArticleLoaded({required this.blog});
}

class ArticleError extends ArticleState {}

class PostArticleLoaded extends ArticleState {
  final bool isDone;

  PostArticleLoaded({required this.isDone});
}
