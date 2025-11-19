import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';
import 'third_page.dart'; // 👈 Import the ThirdPage

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    print('i am second page page');

    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value: ${counter.count}",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to ThirdPage
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
        onPressed: () => counter.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
