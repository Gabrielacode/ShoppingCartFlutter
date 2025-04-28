//Here we will define some DAO  methods to use
import 'package:sampleshopingcartapp/service/model.dart';
import 'package:sqflite/sqflite.dart';

class CartDAO{
  Database database;
  CartDAO({required this. database});

 Future<void>  insertCartItem(CartItem item)async{
    await database.insert(CartItem.TABLE_NAME, item.toMap(),);
  }

 Future<void> deleteCartItem(CartItem item)async{
   await database.delete(CartItem.TABLE_NAME,where: '${CartItem.ID_COLUMN} = ?',whereArgs: [item.id]);
 }

 //For the list of data we want to get the data everytime there an insert or delete

  Future<List<CartItem>> getCartItems ()async{
   var results = await database.query(CartItem.TABLE_NAME);
   return results.map((element)=>CartItem.fromMap(element)).toList();
  }

}
