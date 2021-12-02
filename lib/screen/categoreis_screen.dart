import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist_bloc_lib/bloc/watchlist_bloc.dart';
import 'package:watchlist_bloc_lib/model/contact_data_model.dart';
import 'package:watchlist_bloc_lib/service/contactrespo.dart';

import 'package:watchlist_bloc_lib/widget/contact_item.dart';

class CategoriesScreen extends StatefulWidget {
  List<Contact> data;
  CategoriesScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<CategoriesScreen> createState() {
    return _CategoriesScreenState(data);
  }
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late WatchlistBloc watchlistBloc = WatchlistBloc(ContactService());
  List<Contact> data;

  _CategoriesScreenState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Center(
          child: listItem(context, data),
        ),
      ),
    ));
  }
}
