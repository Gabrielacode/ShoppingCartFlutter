//We will be using normal Sqflite



import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model.dart';

class CartDatabaseHelper{
  //Here we will define our database

  //We will define a private database
 static Database? _database;

  Future<Database> get database async{
    _database ??= await openCartDatabase();
    return _database!;
  }

  //Here we open the database
  Future<Database> openCartDatabase() async{
    //We get the path from where we will store the database depending on whether Android or Ios
    var databasePath = await getDatabasesPath();
    //We will now create the full path of our database by joining the database path with the name of our database
    var fullPath = join(databasePath,"cart.db");
    //Then we open our database
    var database = await openDatabase(fullPath,version: 1,
    onCreate: (database,version){
      //This will be used when the database is created for the first time
      //We will use the cart item to create a table
      database.execute(CartItem.createTable());
    });
    return database;

  }



}