import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc_lib/bloc/watchlist_bloc.dart';
import 'package:watchlist_bloc_lib/bloc/watchlist_event.dart';
import 'package:watchlist_bloc_lib/model/contact_data_model.dart';
import 'package:watchlist_bloc_lib/screen/categoreis_screen.dart';
import 'package:watchlist_bloc_lib/service/contactrespo.dart';
import 'package:watchlist_bloc_lib/src/string.dart';
import 'package:watchlist_bloc_lib/widget/contact_item.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late WatchlistBloc watchlistBloc = WatchlistBloc(ContactService());

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 4);
    watchlistBloc.add(FetchContactData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => watchlistBloc,
      child: DefaultTabController(
        length: Strings.name.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              Strings.title,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorWeight: 4.0,
              indicatorColor: Colors.blue,
              tabs: Strings.name,
              labelColor: Colors.black,
            ),
          ),
          body: BlocBuilder<WatchlistBloc, WatchlistState>(
            builder: (context, state) {
              if (state is Contactblocloading) {
                return const Text(Strings.loading);
              } else if (state is ContactFetchData) {
                List<Contact> contactdata = state.contacts;
                if (contactdata == []) {
                  return const Text(Strings.loading);
                } else {
                  return TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      CategoriesScreen(data: contactdata.sublist(0, 25)),
                      CategoriesScreen(data: contactdata.sublist(25, 50)),
                      CategoriesScreen(data: contactdata.sublist(50, 75)),
                      CategoriesScreen(data: contactdata.sublist(75)),
                    ],
                  );
                }
              } else if (state is ContactError) {
                return const Text(Strings.unknownError);
              } else {
                return const Text(Strings.unknownError);
              }
            },
          ),
        ),
      ),
    );
  }
}
