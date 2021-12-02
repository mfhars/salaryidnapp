

import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/news/list_item_news.dart';
import 'package:flutter_app_3/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailNews extends StatelessWidget {
  final ListItemNews itemNews;
  const DetailNews({required this.itemNews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    itemNews.imgPath!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(itemNews.title!,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: primaryColor,
                      fontWeight: semiBold
                    )
                  ),),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.person),
                        Text(itemNews.author!),
                        SizedBox(
                          width: 40,
                        ),
                        Icon(Icons.calendar_today),
                        Text(itemNews.date!)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(itemNews.content!,
                    textAlign: TextAlign.justify,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                  color: kBlackColor),
            )
          ],
        ),
      ),
    );
  }
}
