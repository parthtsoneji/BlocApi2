import 'package:bloc3/Apical/Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/partner_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool gest = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => PartnerBloc(PartnerApi()),
          child: Scaffold(
            body: Center(
              child: GestureDetector(
                  onTap: () {
                      BlocProvider.of(context)
                    },
                  child: Container(
                      color: Colors.red,
                      child: Text("Click here"))),
            ),
            ),
          ));
  }

}
