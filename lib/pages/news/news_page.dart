

import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/list_item_widget.dart';
import 'package:flutter_app_3/pages/news/detail_news.dart';
import 'package:flutter_app_3/pages/news/list_item_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // List<ListItemNews> _listItem = [
  //   ListItemNews(imgPath: imgPath, title: title, author: author, date: date)
  // ];

  List<ListItemNews> _listItem = [
    ListItemNews(
        imgPath: 'images/img_news.jpeg',
        title: 'Judul Berita 1',
        author: 'Fulan',
        date: '30-10-2021',
        content: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
    ListItemNews(
        imgPath: 'images/img_news.jpeg',
        title: 'Judul Berita 2',
        author: 'Fulan abud',
        date: '30-11-2021',
        content: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
  ];

  @override
  Widget build(BuildContext context) {
    ListItemNews? listItemNews;
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var berita = _listItem[index];
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DetailNews(
                              itemNews: berita,
                            )));
              },
              child: listItem(_listItem[index]));
        },
        itemCount: _listItem.length,
      ),
    );
  }
}
