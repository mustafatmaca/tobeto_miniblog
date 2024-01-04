import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final String? id;
  final String title;
  final String content;
  final String thumbnail;
  final String author;

  Blog(
      {this.id,
      required this.title,
      required this.content,
      required this.thumbnail,
      required this.author});

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        thumbnail: json['thumbnail'],
        author: json['author'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['thumbnail'] = this.thumbnail;
    data['author'] = this.author;
    return data;
  }

  @override
  List<Object?> get props => [id, title, content, thumbnail, author];
}
