import 'package:flutter/material.dart';
import 'package:news/api/api.dart';
import 'package:news/ui/screens/news_screen.dart';
import 'package:news/ui/widgets/news_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/database_model.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final API api = API();
  List<DbModel> article = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HEADLINES',
          style: GoogleFonts.robotoSlab(
              fontSize: 29,
              color: Color(0xFFffffff),
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
              future: api.topHeadlines().then((value) {
                return article = value;
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: NewsCard(article: article[index]),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsScreen(article: article[index],)));
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 24,
                        );
                      },
                      itemCount: article.length);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
          // ListView(
          //   children: [
          //     GestureDetector(
          //       child: NewsCard(),
          //       onTap: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => NewsScreen()));
          //       },
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
