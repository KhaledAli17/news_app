import 'package:flutter/material.dart';
import 'package:flutter_app_news/cubit/news_cubit.dart';
import 'package:flutter_app_news/cubit/news_states.dart';
import 'package:flutter_app_news/network/local/cache_helper.dart';
import 'package:flutter_app_news/search/search_screen.dart';
import 'package:flutter_app_news/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsHome extends StatefulWidget {
  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {

  @override
  Widget build(BuildContext context) {
    // ignore: file_names
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                  onPressed: () {

                      NewsCubit.get(context).changeAppMode(fromShared: NewsCubit.get(context).isDark);


                  },
                  icon: Icon(Icons.brightness_4_rounded),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }

}
