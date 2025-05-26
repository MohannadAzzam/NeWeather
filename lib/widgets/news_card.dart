
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/extension.dart';
import '../routers/routers.dart';

class NewsCard extends StatelessWidget {
  final String author;
  final String? description;
  final String title;
  final String urlToImage;
  const NewsCard({
    super.key,
    required this.author,
    this.description,
    required this.title,
    required this.urlToImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routers.newsDetails, {
          'author': author,
          'description': description,
          'title': title,
          'urlToImage': urlToImage,
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Card(
          elevation: 3.r,
          borderOnForeground: true,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Hero(
                    tag: 'image',
                    child: Image.network(
                      // ignore: unnecessary_null_comparison
                      (urlToImage.isNotEmpty) && (urlToImage != null)
                          ? urlToImage
                          : 'https://graphicsprings.com/wp-content/uploads/2023/07/image-58-1024x512.png',
                    ),
                  ),
                ),
                ListTile(title: Text(author), subtitle: Text(title)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
