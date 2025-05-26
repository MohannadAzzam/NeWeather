import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetails extends StatefulWidget {
  final String author;
  final String description;
  final String title;
  final String urlToImage;

  const NewsDetails({
    super.key,
    required this.author,
    required this.description,
    required this.title,
    required this.urlToImage,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    var image = widget.urlToImage;
    var author = widget.author;
    var title = widget.title;
    var description = widget.description;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                overflow: TextOverflow.fade,
                author,
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(/*color: Colors.white*/),
                ),
              ),
              background: Hero(
                tag: 'image',
                child: Image.network(image, height: 250, fit: BoxFit.cover),
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListTile(
                autofocus: true,
                titleTextStyle: TextStyle(
                  /*color: Colors.black,*/ fontSize: 20,
                ),
                title: Text(title),

                subtitle: Text('''
${description + description + description + description + description + description + description + description + description}
'''),
              );
            },
          ),
        ],
      ),
    );
  }
}
