import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/news/list_item_news.dart';

Widget listItem(ListItemNews listItemNews) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(listItemNews.imgPath!),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listItemNews.title!),
                SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Icon(Icons.person),
                    Text(listItemNews.author!),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.calendar_today),
                    Text(
                      listItemNews.date!,
                      // overflow: TextOverflow.ellipsis,
                      // maxLines: 3,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
