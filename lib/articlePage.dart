// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source.name),
      ),
      body: Column(
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(article.urlToImage), fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.justify,
              article.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'SF Pro'),
            ),
          ),
          // Container(
          //   child: Text('Published at: '),
          //   alignment: Alignment.topLeft,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Published at: ",
                  style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                ),
                Text(
                  article.publishedAt,
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.justify,
              article.content,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  fontFamily: 'SF Pro'),
            ),
          ),
          SizedBox(
            height: 36.0,
          ),
          Container(
              // alignment: Alignment.bottomCenter,
              // alignment: Alignment.bottbottomRight,
              alignment: Alignment.bottomLeft,
              // color: Colors.red,
              padding: EdgeInsets.only(bottom: 0.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Source: "),
                    RichText(
                      text: TextSpan(
                        text: article.url,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 12.0,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            if (await canLaunch(article.url)) {
                              await launch(article.url);
                            } else {
                              throw 'Could not launch $article.url';
                            }
                          },
                      ),
                    ),
                  ],
                ),
              )
              // Text(
              //   article.url,
              //   style: TextStyle(
              //     fontSize: 11.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        color: Colors.grey[200],
        child: Center(
          child: Text(
            "NewsAPI Flutter project by Elmar",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
