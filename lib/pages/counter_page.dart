import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Content(),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<Counter>().increment,
        child: Icon(Icons.add),
      ),
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  int myCounter = 0;
  @override
  void initState() {
    super.initState();
    context.read<Counter>().increment();
    myCounter = context.read<Counter>().counter + 10;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'counter: ${context.watch<Counter>().counter}\n My Counter:$myCounter',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
