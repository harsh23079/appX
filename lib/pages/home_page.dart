import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';
import 'second_page.dart';
import 'third_page.dart'; // 👈 import ThirdPage

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    print('I am HomePage');

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: ${counter.count}",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to SecondPage using current context
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SecondPage()),
                );
              },
              child: const Text("Go to Second Page"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to ThirdPage using current context
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ThirdPage()),
                );
              },
              child: const Text("Go to Third Page"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
