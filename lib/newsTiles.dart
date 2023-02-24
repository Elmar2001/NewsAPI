import 'article.dart';
import 'package:flutter/material.dart';
import 'articlePage.dart';

Widget newsTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(article: article),
          ));
    },
    child: Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2.0),
          ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              // margin: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(8.0)),
              child: Text(
                article.source.name,
                style: TextStyle(color: Colors.white, fontFamily: 'SF Pro'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              article.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  fontFamily: 'SF Pro'),
            )
          ]),
    ),
  );
}
