import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miniblog/models/blog.dart';
import 'package:http/http.dart' as http;

class BlogDetail extends StatefulWidget {
  final String id;
  const BlogDetail({required this.id, Key? key}) : super(key: key);

  @override
  _BlogDetailState createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBlogDetails();
  }

  Future<Blog> fetchBlogDetails() async {
    Uri url = Uri.parse(
        "https://tobetoapi.halitkalayci.com/api/Articles/${widget.id}");
    final response = await http.get(url);
    final jsonData = json.decode(response.body);
    return Blog.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchBlogDetails(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data!.title),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: 4 / 2,
                      child: Image.network(snapshot.data!.thumbnail)),
                  Text(
                    snapshot.data!.author,
                    style: const TextStyle(
                        color: Colors.black45,
                        fontStyle: FontStyle.italic,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    snapshot.data!.content,
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Detaylar"),
            ),
            body: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
