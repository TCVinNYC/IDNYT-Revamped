import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage(name: 'ExtraPage')
class ExtraPage extends HookConsumerWidget {
  const ExtraPage({Key? key}) : super(key: key);

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
              const Text('Hey this is the extra page!'),
              Container(
                color: Colors.blue,
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
