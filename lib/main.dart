import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_dio_manuour/api_manager/api_manager.dart';
import 'package:newsapp_dio_manuour/bussniss_logic/news_cubit.dart';
import 'package:newsapp_dio_manuour/shared_pref/share_pref.dart';

import 'bussniss_logic/bloc_observer.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiManager.init();
  await sharePref.init();
  bool? isDark = sharePref.getData(key: 'isDark');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /*bool isDark;

  MyApp(this.isDark); */ // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..changeThemeMode()
        ..getBusniss()
        ..getSports()
        ..getScience(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange, elevation: 0),
                iconTheme: IconThemeData(
                  size: 30,
                  color: Colors.deepOrange,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                primarySwatch: Colors.deepOrange,
              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.grey,
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black45,
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: Colors.black45,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.black45,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 0),
                iconTheme: IconThemeData(
                  size: 30,
                  color: Colors.deepOrange,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                primarySwatch: Colors.deepOrange,
              ),
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: HomeScreen());
        },
      ),
    );
  }
}
