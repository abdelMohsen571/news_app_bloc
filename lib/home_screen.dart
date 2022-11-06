import 'package:flutter/material.dart';
import 'package:newsapp_dio_manuour/api_manager/api_manager.dart';
import 'package:newsapp_dio_manuour/bussniss_logic/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_dio_manuour/layouts/screens/search_layout.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchLayout()));
                  },
                  icon: Icon(
                    Icons.search,
                  )),
              IconButton(
                  onPressed: () {
                    cubit.changeThemeMode();
                  },
                  icon: Icon(
                    Icons.brightness_4,
                  )),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_sharp), label: "bussniss"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: "Sports"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: "Science"),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
