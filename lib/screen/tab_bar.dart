import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist_bloc_lib/screen/categoreis_screen.dart';
import 'package:watchlist_bloc_lib/src/string.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Strings.name.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            Strings.title,
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
            indicatorWeight: 4.0,
            indicatorColor: Colors.blue,
            tabs: Strings.name,
            labelColor: Colors.black,
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            CategoriesScreen(),
            CategoriesScreen(),
          ],
        ),
      ),
    );
  }
}
