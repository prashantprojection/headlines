import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/model/database_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({required this.article, Key? key}) : super(key: key);

  final DbModel article;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('${article.urlToImage}'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          height: 210,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent]),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${article.title}',
                  style: GoogleFonts.robotoSlab(
                      fontSize: 20, color: Color(0xFFf2f2f2),),maxLines: 2,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(children: [
                  Text(
                    '${article.name} ',
                    style: GoogleFonts.robotoSlab(
                        fontSize: 12,
                        color: Color(0xFFbababa),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${article.publishedAt}',
                    style: GoogleFonts.robotoSlab(
                        fontSize: 12,
                        color: Color(0xFFbababa),),
                  )
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
