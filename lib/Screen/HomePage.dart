import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Apical/Repository.dart';
import '../Bloc/partner_bloc.dart';
import '../Model/Partner_Model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PartnerBloc? partnerBloc;
  @override
  void initState() {
    super.initState();
    partnerBloc = PartnerBloc(PartnerApi());
    print('hello ${partnerBloc.toString()}');
    partnerBloc != null ? partnerBloc!.add(PartnerLoadEvent()) : null;
  }
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _PartnerDetails(),
    );
  }
  _PartnerDetails() {
    return BlocProvider(create: (context) => partnerBloc!,
        child: BlocBuilder<PartnerBloc,PartnerState>(
          builder: (context, state)
          {
            if (state is PartnerLoadingState) {
              return const Center(child: CircularProgressIndicator());
            };
            if (state is PartnerLoadedState) {
              Partner list = state.loaded;
              print(list);
              return ListView.builder(
                  itemCount: list.data!.partners!.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Card(
                          child: ListTile(
                            title: Text(
                              list.status.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                            trailing: Text(
                                list.count.toString(),
                                style: const TextStyle(color: Colors.black)),
                            subtitle: Text(
                              list.data!.partners![index].name.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                            leading: Text(
                              list.data!.partners![index].email.toString(),
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
