import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc_lib/bloc/watchlist_bloc.dart';
import 'package:watchlist_bloc_lib/screen/tab_bar.dart';
import 'service/contactrespo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WatchlistBloc(ContactService()),
        child: const TabBarScreen(),
      ),
    );
  }
}
