import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussniss_logic/news_cubit.dart';
import 'news_item.dart';

class News_builder extends StatelessWidget {
  dynamic list;

  News_builder(this.list);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: list.length > 0,
        builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => NewsItem(list[index]),
            separatorBuilder: (context, index) => Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.deepOrange,
                ),
            itemCount: 10),
        fallback: (context) => Center(child: CircularProgressIndicator()));
  }
}
