import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:statenotifiersample/counter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage.create(),
    );
  }
}

@immutable
class MyHomePage extends StatelessWidget {
  const MyHomePage._();

  static Widget create() =>
      StateNotifierProvider<CounterController, CounterState>(
        create: (_) => CounterController(),
        child: const MyHomePage._(),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const CounterText(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterController>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

@immutable
class CounterText extends StatelessWidget {
  const CounterText();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.select((CounterState s) => s.count).toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
