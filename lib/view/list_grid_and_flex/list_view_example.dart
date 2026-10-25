import 'package:flutter/material.dart';

class ListExample extends StatelessWidget {
  const ListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student List")),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Rahim"),
            subtitle: Text("Flutter Student"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Karim"),
            subtitle: Text("Flutter Student"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Sadia"),
            subtitle: Text("Flutter Student"),
          ),
        ],
      ),
    );
  }
}
