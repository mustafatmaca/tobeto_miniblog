import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/detail_bloc/detail_event.dart';
import 'package:miniblog/blocs/detail_bloc/detail_state.dart';
import 'package:miniblog/repositories/article_repository.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final ArticleRepository articleRepository;

  DetailBloc({required this.articleRepository}) : super(DetailInitial()) {
    on<FetchDetailById>(_onFetchDetailById);
  }

  void _onFetchDetailById(
      FetchDetailById event, Emitter<DetailState> emit) async {
    emit(DetailLoading());

    try {
      final article = await articleRepository.fetchBlogById(event.id);
      emit(DetailLoaded(blog: article));
    } catch (e) {
      emit(DetailError());
    }
  }
}
