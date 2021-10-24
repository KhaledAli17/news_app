
import 'package:flutter/material.dart';
import 'package:flutter_app_news/cubit/news_cubit.dart';
import 'package:flutter_app_news/cubit/news_states.dart';
import 'package:flutter_app_news/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context, state){},
      builder: (context , state){
        var list = NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefix: Icon(Icons.search),
                    border: OutlineInputBorder(),

                  ),
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value);

                  },
                  validator: (String? value) {
                    if( value!.isEmpty){
                      return 'search must not be empty';
                    }
                    return null;
                  },


                ),
              ),

              Expanded(child: articleBuilder(list, context, isSearch:  true))
            ],
          ),
        );

      },
    );
  }
}
