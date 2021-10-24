//import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_news/cubit/news_cubit.dart';
import 'package:flutter_app_news/cubit/news_states.dart';
import 'package:flutter_app_news/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return articleBuilder(list,context);
      },
    );
  }
}

/*
ConditionalBuilder(
condition: state is! NewsBusinessLoading,
builder: (context) => ListView.separated(
itemBuilder: (context , index) => buildArticleItem(),
separatorBuilder: (context , index) => myDivider(),
itemCount: 10) ,
fallback: (context) => Center(child: CircularProgressIndicator()),

);*/
/*ListView.separated(
physics: BouncingScrollPhysics(),
itemBuilder:(context , index) => buildArticleItem (list[index]),
separatorBuilder:(context , index) => myDivider(),
itemCount: list.length,);*/
