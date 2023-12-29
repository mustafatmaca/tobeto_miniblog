class Blog {
  String? id;
  String title;
  String content;
  String thumbnail;
  String author;

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
}
