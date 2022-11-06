import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_dio_manuour/bussniss_logic/news_cubit.dart';

import '../widgets/news_builder.dart';
import '../widgets/news_item.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        dynamic list = NewsCubit.get(context).science;
        return News_builder(list);
      },
    );
  }
}
