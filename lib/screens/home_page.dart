import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/article_bloc/article_state.dart';
import 'package:miniblog/screens/add_blog.dart';
import 'package:miniblog/widgets/blog_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloglar"),
        actions: [
          IconButton(
            onPressed: () async {
              bool result = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddBlog()));

              if (result == true) {
                context.read<ArticleBloc>().add(FetchArticles());
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
        if (state is ArticleInitial) {
          context.read<ArticleBloc>().add(FetchArticles());
          return const Center(
            child: Text("İstek Atılıyor..."),
          );
        }
        if (state is ArticleLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ArticlesLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ArticleBloc>().add(FetchArticles());
            },
            child: ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) =>
                    BlogItem(blog: state.blogs[index])),
          );
        }
        if (state is ArticleError) {
          return Center(
            child: Text("Hata"),
          );
        }

        return Center(
          child: Text("Unknown State"),
        );
      }),
    );
  }
}
