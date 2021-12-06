import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_logics.dart';
import 'package:flutter_cubit/misc/pages/detail_page.dart';
import 'package:flutter_cubit/misc/pages/navpages/main_page.dart';
import 'package:flutter_cubit/misc/pages/welcome-page.dart';
import 'package:flutter_cubit/services/data_services.dart';

import 'cubit/app_cubits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AppCubits(
          data: DataServies(),
        ),
        child: AppCubitLogics(),
      ),
    );
  }
}
