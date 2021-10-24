import 'package:flutter/material.dart';
import 'package:flutter_app_news/cubit/news_states.dart';
import 'package:flutter_app_news/modules/business.dart';
import 'package:flutter_app_news/modules/sciences.dart';
import 'package:flutter_app_news/modules/sports.dart';
import 'package:flutter_app_news/network/local/cache_helper.dart';
import 'package:flutter_app_news/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    /*BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings'),*/
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    //SettingsScreen(),
  ];
  void changeBottomNavBar(index) {
    currentIndex = index;
    if (index == 1) getSportsData();

    if (index == 2) getScienceData();

    emit(NewsBottomNavStates());
  }

  List<dynamic> business = [];

  void getBusinessData() {
    emit(NewsBusinessLoading());
    if (business.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '27a6f93cfb4b4c44b0f60d810f3086f4 ',
      }).then((value) {
        print(value.data['articles'][0]['title'].toString());
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsBusinessSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(NewsBusinessFailed(error.toString()));
      });
    } else {
      emit(NewsBusinessLoading());
    }
  }

  List<dynamic> sports = [];

  void getSportsData() {
    emit(NewsSportsLoading());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '27a6f93cfb4b4c44b0f60d810f3086f4 ',
      }).then((value) {
        print(value.data['articles'][0]['title'].toString());
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsSportsSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(NewsSportsFailed(error.toString()));
      });
    } else {
      emit(NewsSportsLoading());
    }
  }

  List<dynamic> science = [];

  void getScienceData() {
    emit(NewsScienceLoading());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '27a6f93cfb4b4c44b0f60d810f3086f4',
      }).then((value) {
        print(value.data['articles'][0]['title'].toString());
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsScienceSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(NewsScienceFailed(error.toString()));
      });
    } else {
      emit(NewsScienceLoading());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    search = [];
    emit(NewsSearchLoading());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '27a6f93cfb4b4c44b0f60d810f3086f4',
    }).then((value) {
      print(value.data['articles'][0]['title'].toString());
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsSearchSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSearchFailed(error.toString()));
    });
  }

  bool isDark = true;

  void changeAppMode({required bool fromShared})
  {
    if (fromShared != null)
    {
      isDark = fromShared;
      emit(ChangeModeStateDark());
    } else
    {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeModeStateLight());
      });
    }
  }

 /* void changeAppMode() {
    isDark = !isDark;
    emit(ChangeModeState());
  }*/
}
