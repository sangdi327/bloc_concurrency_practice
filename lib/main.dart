import 'package:bloc_concurrency_practice/bloc/picture_bloc.dart';
import 'package:bloc_concurrency_practice/repository/picture_repository.dart';
import 'package:bloc_concurrency_practice/view/picture_changer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)),
      home: RepositoryProvider(
        create: (context) => PictureRepository(),
        child: BlocProvider(
          create: (context) => PictureBloc(context.read<PictureRepository>()),
          child: const PictureChanger(),
        ),
      ),
    );
  }
}
