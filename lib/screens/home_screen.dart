import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/navigation/navigation_cubit.dart';
import 'news_screeen.dart';
import 'settings_screen.dart';
import 'whether_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> myScreens = [
    NewsScreen(),
    WhetherScreen(),
    SettingsScreen(),
  ];

  final List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(label: "News", icon: Icon(Icons.article)),
    BottomNavigationBarItem(label: "Weather", icon: Icon(Icons.cloud)),
    BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: myScreens[state],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (index) {
              context.read<NavigationCubit>().changeTab(index);
            },
            items: bottomNavigationItems,
          ),
        );
      },
    );
  }
}
