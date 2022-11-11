import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fvm/bloc/pokemon_bloc_bloc.dart';
import 'package:flutter_fvm/view/homepage.dart';
import 'package:get/get.dart';
import 'repository/repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final hasNext = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocProvider<PokemonBlocBloc>(
          create: (context) => PokemonBlocBloc()..add(GetEventData()),
          child: HomePage(),
        ),);
  }
}
