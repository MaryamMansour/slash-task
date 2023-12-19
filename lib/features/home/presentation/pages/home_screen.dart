import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body: Column(
        children: [
          SizedBox(height: 300,),
          Center(child: Text("HOME",style: TextStyle(color: Colors.black, fontSize: 34),))
        ],
      ),
    );
  }
}
