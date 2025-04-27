import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:TestAnimApp(),
    );
  }
}

class TestAnimApp extends StatefulWidget {
  const TestAnimApp({super.key});

  @override
  State<TestAnimApp> createState() => _TestAnimAppState();
}

class _TestAnimAppState extends State<TestAnimApp> {
  //To use implicity animated widgets we have to use stateful widget to rebuild them with new values so that they can rebuild
   double width = 40;
   double height = 40;
   Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:

          Center(
            child: TweenAnimationBuilder(tween: IntTween(begin:Random().nextInt(200),end:Random().nextInt(200)), duration: const Duration(seconds:2), builder:(context,value,child){
              return Container(
                width: value.toDouble(),
                height: height,
                color: color,
              );
            }),
          ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            //We rebuild with new settings
            var rand = Random();

            width = rand.nextInt(250).toDouble();
            height = rand.nextInt(250).toDouble();

            color = Color.fromRGBO(
              rand.nextInt(256)
            ,   rand.nextInt(256),   rand.nextInt(256), 1);
          });
        },child: const Icon(Icons.play_arrow_outlined),),
      ),
    );
  }
}

