// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        shadowColor: Colors.black,
        title: Text(
          'Flutter Batch-02',
          style: TextStyle(fontFamily: 'EduQLDHand'),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'My hobby',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                  fontFamily: 'EduQLDHand',
                ),
              ),
              SizedBox(height: 16),
              Text(
                "I don't really know what my hobbies are yet. If I'm being completely honest, my favorite thing to do in my free time is just sleep and recharge.",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'EduQLDHand',
                  fontSize: 24,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 8),

              /// you can add image from assets or network

              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG5h7TiqhDqgujXrxiUf4rwFfw-Izg5tqNrs31U48JxdQ4kBs9wF5LS58&s=10',
              ),

              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit My Hobby'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
