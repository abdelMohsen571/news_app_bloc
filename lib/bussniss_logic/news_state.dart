part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class BottomNavigationBarState extends NewsState {}

class NewsGetBusnissSucessState extends NewsState {}

class NewsGetBusnissErrorState extends NewsState {
  final String error;
  NewsGetBusnissErrorState(this.error);
}

class NewsGetBusnissLoadingState extends NewsState {}

class NewsGetSportsSucessState extends NewsState {}

class NewsGetSportsErrorState extends NewsState {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsState {}

class NewsGetScienceSucessState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsState {}

class NewsGetSearchSucessState extends NewsState {}

class NewsGetSearchErrorState extends NewsState {
  final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsState {}

class NewsChangeThemeMode extends NewsState {}
