abstract class DetailEvent {}

class FetchDetailById extends DetailEvent {
  final String id;

  FetchDetailById({required this.id});
}

class ResetEvent extends DetailEvent {}
