import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_theme/bloc/theme_bloc.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, themeData) {
          return Center(
            child: Text(
                themeData == ThemeData.dark()
                    ? 'Bye world'
                    : 'Hello world',
                style: Theme.of(context).textTheme.titleMedium),
          );
        },
      ),
    );
  }
}
