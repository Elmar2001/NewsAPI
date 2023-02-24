import 'package:flutter/material.dart';
import 'package:newsag/apiservice.dart';
import 'package:newsag/newsTiles.dart';
import 'article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("News Aggregator"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.blueGrey,
              height: 4.0,
            ),
          )),
      body: FutureBuilder(
          future: client.fetchArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data!;

              return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      newsTile(articles[index], context));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
