import 'package:bloc_api/bloc/userbloc_bloc.dart';
import 'package:bloc_api/screens/bloc_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserblocBloc>(
      create: (_) => UserblocBloc(),
      child: MaterialApp(
        title: 'Flutter Bloc Api Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Bloc_call(),
      ),
    );
  }
}
