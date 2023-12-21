import 'package:flutter/material.dart';
import 'package:miniblog/models/blog.dart';
import 'package:miniblog/screens/blog_detail.dart';

class BlogItem extends StatelessWidget {
  final Blog blog;
  const BlogItem({required this.blog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetail(id: blog.id),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 4 / 2, child: Image.network(blog.thumbnail)),
            ListTile(
              title: Text(blog.title),
              subtitle: Text(blog.author),
            )
          ],
        ),
      ),
    );
  }
}
