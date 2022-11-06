import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_dio_manuour/bussniss_logic/news_cubit.dart';
import 'package:newsapp_dio_manuour/bussniss_logic/news_cubit.dart';
import 'package:newsapp_dio_manuour/layouts/widgets/news_builder.dart';

class SearchLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 5)),
                      prefix: Icon(Icons.search),
                      labelText: "search",
                      labelStyle: Theme.of(context).textTheme.bodyText1),
                  onChanged: (text) {
                    NewsCubit.get(context).getSearch(text);
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "search is empty";
                    }

                    return null;
                  },
                ),
                News_builder(list)
              ],
            ),
          ),
        );
      },
    );
  }
}
