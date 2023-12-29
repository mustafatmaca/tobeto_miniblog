abstract class ArticleEvent {}

class FetchArticles extends ArticleEvent {}

class PostArticle extends ArticleEvent {
  final String title;
  final String content;
  final String thumbnail;
  final String author;

  PostArticle(
      {required this.title,
      required this.content,
      required this.thumbnail,
      required this.author});
}

class ResetEvent extends ArticleEvent {}
