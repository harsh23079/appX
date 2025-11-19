import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('I am third page');
    return Scaffold(
      appBar: AppBar(title: const Text("Third Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is the Third Page. No counter here!",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show a simple popup string using SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Button pressed! Hello from Third Page."),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text("Press me"),
            ),
          ],
        ),
      ),
    );
  }
}
