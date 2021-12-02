import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc_lib/bloc/watchlist_bloc.dart';
import 'package:watchlist_bloc_lib/screen/tab_bar.dart';
import 'package:watchlist_bloc_lib/src/string.dart';
import 'service/contactrespo.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabBarScreen(),
    );
  }
}
