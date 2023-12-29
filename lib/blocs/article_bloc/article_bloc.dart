import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/article_bloc/article_state.dart';
import 'package:miniblog/repositories/article_repository.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;

  ArticleBloc({required this.articleRepository}) : super(ArticleInitial()) {
    on<FetchArticles>(_onFetchArticles);
    on<PostArticle>(_onPostArticle);

    on<ResetEvent>(_onResetEvent);
  }

  void _onFetchArticles(FetchArticles event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());

    try {
      final articles = await articleRepository.fetchAllBlogs();
      emit(ArticlesLoaded(blogs: articles));
    } catch (e) {
      emit(ArticleError());
    }
  }

  void _onPostArticle(PostArticle event, Emitter<ArticleState> emit) async {
    try {
      await articleRepository.postBlog(
          event.title, event.content, event.author, event.thumbnail);
      emit(ArticleInitial());
    } catch (e) {
      emit(ArticleError());
    }
  }

  void _onResetEvent(ResetEvent event, Emitter<ArticleState> emit) async {
    emit(ArticleInitial());
  }
}