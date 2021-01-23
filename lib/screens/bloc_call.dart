import 'dart:js';

import 'package:bloc_api/bloc/userbloc_bloc.dart';
import 'package:bloc_api/models/userdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading.dart';

class Bloc_call extends StatefulWidget {
  @override
  _Bloc_callState createState() => _Bloc_callState();
}

class _Bloc_callState extends State<Bloc_call> {
  UserblocBloc userblocBloc;

  @override
  void initState() {
    super.initState();
    // userblocBloc = BlocProvider.of<UserblocBloc>(context);
    // userblocBloc.add(GetUserDetailFromAPI());
  }

  @override
  Widget build(BuildContext context) {
    userblocBloc = BlocProvider.of<UserblocBloc>(context);
    userblocBloc.add(GetUserDetailFromAPI());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Title(
            color: Colors.blue,
            child: Text(
              "Bloc API Call",
              style: TextStyle(fontSize: 18.0),
            )),
      ),
      body: Container(child:
          BlocBuilder<UserblocBloc, UserblocState>(builder: (context, state) {
        if (state is LoadingState) {
          return Loading();
        }
        if (state is LoadedState) {
          List<Datum> data = state.userData.data;
          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.black12,
                height: 2.0,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  backgroundImage: NetworkImage(data[index].avatar),
                  radius: 30,
                ),
                title: Text(
                  data[index].firstName,
                  style: TextStyle(fontSize: 18.0),
                ),
                subtitle: Text(
                  data[index].email,
                  style: TextStyle(fontSize: 18.0),
                ),
                trailing: Text(
                  data[index].id.toString(),
                  style: TextStyle(fontSize: 18.0),
                ),
              );
            },
          );
        }
        return Loading();
      })),
    );
  }
}
