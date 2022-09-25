import 'package:flutter/material.dart';
import 'package:gymnotes/ui/second/second_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SecondViewModel>.reactive(
      viewModelBuilder: () => SecondViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.doSomething(),
        ),
        body: Center(
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
          )
        ),
      ),
    );
  }
}