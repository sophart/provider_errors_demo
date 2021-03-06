import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter.dart';

class HandleDialogPage extends StatelessWidget {
  const HandleDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Handle Dialog'),
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
  @override
  void initState() {
    super.initState();

    //! The problems
    //! Show the dialog while other widget has not been built
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("The Dialog"),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<Counter>().counter.toString(),
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
