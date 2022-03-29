import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_errors_demo/pages/counter_page.dart';
import 'package:provider_errors_demo/pages/handle_dialog_page.dart';
import 'package:provider_errors_demo/pages/navigate_page.dart';

import '../providers/counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Error Demo'),
      ),
      body: Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => Counter(),
                      child: CounterPage(),
                    ),
                  ),
                );
              },
              child: Text('Counter Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => Counter(),
                      child: HandleDialogPage(),
                    ),
                  ),
                );
              },
              child: Text('Handle Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => Counter(),
                      child: NavigatePage(),
                    ),
                  ),
                );
              },
              child: Text('Navigation'),
            ),
          ],
        ),
      ),
    );
  }
}
