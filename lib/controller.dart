//This is like our view model in Android
//This is our controller
import 'dart:async';

import 'package:sampleshopingcartapp/service/dao.dart';
import 'package:sampleshopingcartapp/service/model.dart';
import 'package:sqflite/sqflite.dart';

class CartController{
  CartDAO dao;
  Database database;
  StreamController<List<CartItem>> controller  = StreamController.broadcast();
   CartController(this.database):
      dao = CartDAO(database: database);



  Future<void> updateCartItems ()async{
     var results = await dao.getCartItems();
     controller.add(results);
   }
  void insertCartItem(CartItem item){
    //We insert first
   dao.insertCartItem(item);
    //Then we update the cart items stream with the list of the new items
   //We will not wait
     updateCartItems();
  }

  void deleteCartItem(CartItem item){
    //We will delete first
    dao.deleteCartItem(item);
    //Then we will update the cart items
    updateCartItems();
  }


}
