import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp_dio_manuour/shared_pref/share_pref.dart';

import '../api_manager/api_manager.dart';
import '../layouts/screens/bussniss_screen.dart';
import '../layouts/screens/science_screen.dart';
import '../layouts/screens/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);

  int currentIndex = 0;
  List<Widget> screens = [BussnissScreen(), SportsScreen(), ScienceScreen()];

  void changeIndex(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(BottomNavigationBarState());
  }

  List<dynamic> busniss = [];
  void getBusniss() {
    emit(NewsGetBusnissLoadingState());
    ApiManager.getData(path: 'v2/top-headlines', query: {
      "apiKey": "4562a9fcacfc4c2ea55f1b39a204282c",
      "category": "business"
    }).then((value) {
      busniss = value.data['articles'];
      print(busniss[0]['title']);
      emit(NewsGetBusnissSucessState());
    }).catchError((e) {
      emit(NewsGetBusnissErrorState(e.toString()));
      print(e.toString());
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    ApiManager.getData(path: 'v2/top-headlines', query: {
      "apiKey": "4562a9fcacfc4c2ea55f1b39a204282c",
      "category": "sports"
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSucessState());
    }).catchError((e) {
      emit(NewsGetSportsErrorState(e.toString()));
      print(e.toString());
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    ApiManager.getData(path: 'v2/top-headlines', query: {
      "apiKey": "4562a9fcacfc4c2ea55f1b39a204282c",
      "country": "eg",
      "category": "science"
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSucessState());
    }).catchError((e) {
      emit(NewsGetScienceErrorState(e.toString()));
      print(e.toString());
    });
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    search = [];
    emit(NewsGetSearchLoadingState());
    ApiManager.getData(path: 'v2/everything', query: {
      "apiKey": "4562a9fcacfc4c2ea55f1b39a204282c",
      'q': '$value',
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSucessState());
    }).catchError((e) {
      emit(NewsGetSearchErrorState(e.toString()));
      print(e.toString());
    });
  }

  bool isDark = true;
  void changeThemeMode({bool? foundpref}) {
    if (foundpref != null) {
      isDark = foundpref;
      emit(NewsChangeThemeMode());
    } else {
      isDark = !isDark;
      sharePref.putDate(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeThemeMode());
      });
      emit(NewsChangeThemeMode());
    }
  }
}
