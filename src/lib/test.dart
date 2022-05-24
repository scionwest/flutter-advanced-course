import 'package:flutter/material.dart';
import 'package:myapp/app/app.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  void updateAppState() {
    MyApp.instance.appState = 5;
  }

  void getAppState() {
    print(MyApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
