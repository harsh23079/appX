import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Info")),
      body: const Center(
        child: Text("User Info Page", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
