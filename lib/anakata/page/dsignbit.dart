import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:go_router/go_router.dart';

void main() => runApp(const artikel());

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ArticleList(),
      routes: [
        GoRoute(
          path: 'article/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return ArticleDetail(articleId: id);
          },
        ),
      ],
    ),
  ],
);

class artikel extends StatelessWidget {
  const artikel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        articles = data.map((json) => Article.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Articles')),
      body: ListView.builder(
        itemCount: articles.length < 2 ? articles.length : 2,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.go('/article/${articles[index].id}');
            },
            child: ArticleCard(article: articles[index]),
          );
        },
      ),
    );
  }
}

class Article {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Article({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Image.network(
              'https://dsignbit.com/public/images/mario-wibowo_1680510463.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleDetail extends StatefulWidget {
  final int articleId;

  const ArticleDetail({Key? key, required this.articleId}) : super(key: key);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  Article? article;

  @override
  void initState() {
    super.initState();
    fetchArticle();
  }

  Future<void> fetchArticle() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/photos/${widget.articleId}',
      ),
    );

    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      setState(() {
        article = Article.fromJson(data);
      });
    } else {
      throw Exception('Failed to load article');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article?.title ?? 'Loading...')),
      body: article == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article!.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.network(
                    'https://dsignbit.com/public/images/mario-wibowo_1680510463.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Text('Album ID: ${article!.albumId}'),
                  Text('ID: ${article!.id}'),
                ],
              ),
            ),
    );
  }
}
