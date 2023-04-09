import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage(name: 'IDCardPage')
class IDCardPage extends HookConsumerWidget {
  const IDCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Hey this is the id card page!'),
              Container(
                color: Colors.green,
                width: 100,
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
