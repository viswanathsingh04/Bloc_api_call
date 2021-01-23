import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
    // return Expanded(
    //   child: Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
  }
}
