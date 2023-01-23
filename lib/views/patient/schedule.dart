import 'package:flutter/material.dart';

import 'package:hospital/views/patient/reusablewidget.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarNav(),
        body: Center(child: Text('Schedule')),
        bottomNavigationBar: bottomnavbar(),
      ),
    );
  }
}
