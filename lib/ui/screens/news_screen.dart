import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/model/database_model.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({required this.article, Key? key}) : super(key: key);

  final DbModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('${article.urlToImage}'),fit: BoxFit.cover)),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,end: Alignment.topCenter,colors: [Colors.black,Colors.transparent])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,size: 42,color: Color(0xFFf2f2f2),),highlightColor: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${article.title}",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 29,
                            color: Color(0xFFf2f2f2),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 64,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text(
                        "${article.name} ",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 20,
                            color: Color(0xFFf2f2f2),),
                      ),
                        Text(
                          article.publishedAt.toString().substring(0,10),
                          style: GoogleFonts.robotoSlab(
                            fontSize: 20,
                            color: Color(0xFFf2f2f2),),
                        ),
                      ],),
                      SizedBox(height: 16,),
                      Text(
                        "${article.content}",
                        style: GoogleFonts.robotoSlab(
                          fontSize: 14,
                          color: Color(0xFFbababa),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
