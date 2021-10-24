import 'package:flutter/material.dart';
import 'package:flutter_app_news/cubit/news_cubit.dart';
import 'package:flutter_app_news/cubit/news_states.dart';
import 'package:flutter_app_news/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state) {},
      builder: (context , state){
        var   list = NewsCubit.get(context).sports;
        return articleBuilder(list,context);

      },
    );
  }
}