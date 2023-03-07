import 'package:bloc3/Apical/Repository.dart';
import 'package:bloc3/Model/Partner_Model.dart';
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
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => PartnerBloc(PostApi()),
      child: Scaffold(
        body: _PartnerDetails(),
      )),
    );
  }

  _PartnerDetails() {
    return BlocProvider(create: (context) => PartnerBloc(PostApi())..add(PartnerLoadEvent()),
    child: BlocBuilder<PartnerBloc,PartnerState>(
      builder: (context, state)
    {
      if (state is PartnerLoadingState) {
        return const Center(child: CircularProgressIndicator());
      };
      if (state is PartnerLoadedState) {
        PostsApi list = state.loaded;
        print(list);
        return ListView.builder(
            itemCount: list.posts!.length,
            itemBuilder: (_, index) {
              return Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Card(
                    child: ListTile(
                      title: Text(
                        list.posts![index].category.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: Text(
                          list.posts![index].isReported.toString(),
                          style: const TextStyle(color: Colors.black)),
                      subtitle: Text(
                        list.posts![index].address.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      leading: Text(
                        list.posts![index].bookByMe.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    )),
              );
            });
      }
      return const Text("Something wrong");
      },
    ));
  }
}