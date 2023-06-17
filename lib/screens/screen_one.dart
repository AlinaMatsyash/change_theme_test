import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_theme/bloc/theme_bloc.dart';
import 'package:test_theme/screens/screen_two.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:
            Text('Test Theme', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ThemeBloc, ThemeData>(
              builder: (context, themeData) {
                return Column(
                  children: [
                    Text(
                        themeData == ThemeData.dark()
                            ? 'Bye world'
                            : 'Hello world',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 15),
                    CupertinoSwitch(
                        value: themeData == ThemeData.dark(),
                        onChanged: (bool val) {
                          context.read<ThemeBloc>().add(SwitchEvent());
                        }),
                    const SizedBox(height: 15),


                  ],
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenTwo()));
                },
                child: Text('Screen two',
                    style: Theme.of(context).textTheme.titleSmall)),
            const Text('')
          ],
        ),
      ),
    );
  }
}
