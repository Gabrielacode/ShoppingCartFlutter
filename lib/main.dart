import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleshopingcartapp/controller.dart';
import 'package:sampleshopingcartapp/pages/mainpage.dart';
import 'package:sampleshopingcartapp/service/database.dart';
import 'package:sqflite/sqflite.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var databaseHelper = CartDatabaseHelper();
  var database= await databaseHelper.database;

  runApp(MyApp(database: database,));
}

class MyApp extends StatelessWidget {
  final Database database;

  const MyApp({super.key, required this.database});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(create: (context)=>CartController(database))
    ],
      builder: (context,child)=>

      MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MainPage()
    ));
  }
}


