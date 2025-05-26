// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/news/cubit/news_cubit.dart';
import 'package:my_app/cubits/news/cubit/news_state.dart';
import 'package:my_app/widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Neweather",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsInitial) {
              context.read<NewsCubit>().fetchNews();
              return Center(child: CircularProgressIndicator());
            } else if (state is NewsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NewsLoaded) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: state.news['articles'].length,
                itemBuilder: (context, index) {
                  return NewsCard(
                    author: "By : ${state.news['articles'][index]['author']}",
                    title: "${state.news['articles'][index]['title']}",
                    urlToImage:
                        "${state.news['articles'][index]['urlToImage']}",
                    description: "${state.news['articles'][index]['content']}",
                  );
                },
              );
            } else if (state is NewsError) {
              return Text(state.message);
            }
            return Text("no data");
          },
        ),
      ),
    );
  }
}
