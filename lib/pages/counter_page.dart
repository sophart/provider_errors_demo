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
    //! Update the state while the page is being rendered
    //! Cause the markNeedsBuild error

    //! Here we need to use read or .of(context, listen: false)
    //! Not the watch
    // context.read<Counter>().increment();
    // myCounter = context.read<Counter>().counter + 10;

    //! The Fix 1
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<Counter>().increment();
      myCounter = context.read<Counter>().counter + 10;
    });

    //! The Fix 2
    // Future.delayed(Duration.zero, () {
    //   context.read<Counter>().increment();
    //   myCounter = context.read<Counter>().counter + 10;
    // });

    //! The Fix 3
    // Future.microtask(() {
    //   context.read<Counter>().increment();
    //   myCounter = context.read<Counter>().counter + 10;
    // });
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
