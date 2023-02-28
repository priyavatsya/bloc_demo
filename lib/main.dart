import 'package:bloc_demo/repo/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/homepage_bloc/app_blocs.dart';
import 'blocs/infopage_bloc/infopage_bloc.dart';
import 'navigation/bottom_navigation.dart';

void main() async {

  runApp(

      MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(
              create: (BuildContext context) => UserBloc(UserRepository()),
            ),

            BlocProvider<NewUserBloc>(
                create: (BuildContext context) => NewUserBloc()
            ),
//BlocConsumer(builder: NewUserBloc, listener: NewUserState)
          ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBar(),

    );
  }
}

