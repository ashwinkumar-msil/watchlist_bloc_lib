import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc_lib/bloc/watchlist_bloc.dart';
import 'package:watchlist_bloc_lib/model/contact_data_model.dart';
import 'package:watchlist_bloc_lib/service/contactrespo.dart';
import 'package:watchlist_bloc_lib/bloc/watchlist_event.dart';
import 'package:watchlist_bloc_lib/src/string.dart';
import 'package:watchlist_bloc_lib/widget/contact_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late WatchlistBloc watchlistBloc = WatchlistBloc(ContactService());

  @override
  void initState() {
    super.initState();
    watchlistBloc.add(FetchContactData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => watchlistBloc,
        child: Scaffold(
            body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BlocBuilder<WatchlistBloc, WatchlistState>(
                builder: (BuildContext context, WatchlistState state) {
              if (state is Contactblocloading) {
                return const Text(Strings.loading);
              } else if (state is ContactFetchData) {
                List<Contact> contactdata = state.contacts;
                if (contactdata == []) {
                  return const Text(Strings.loading);
                } else {
                  return contactlist(context, contactdata);
                }
              } else if (state is ContactError) {
                return const Text(Strings.unknownError);
              } else {
                return const Text(Strings.unknownError);
              }
            }),
          ),
        )));
  }
}
