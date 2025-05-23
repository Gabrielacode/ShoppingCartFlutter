//This is for the Main Page 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleshopingcartapp/controller.dart';
import 'package:sampleshopingcartapp/pages/addcartpage.dart';
import 'package:sampleshopingcartapp/service/model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart"),),
      body: Container(
        child: CartListView(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return  AddCartPage();
        }));
      },child: Icon(Icons.add),),
    );
  }

}

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CartItem>>(
        create: (context){
          var cartController = context.read<CartController>();
         return cartController.controller.stream;
        }, initialData: List.empty(),
      builder: (context, child){
          var listOfCartItems = context.watch<List<CartItem>>();
          print(listOfCartItems.map((element)=> element.id));
          return ListView.builder(itemBuilder: (context,index){
            //We will use index as keys to enable us not rebuild widgets that didn't change
                return CartCard(key:ValueKey(index),item: listOfCartItems[index]);
          },itemCount: listOfCartItems.length,
          );
      },
    );
  }
}


class CartCard extends StatelessWidget {
 final  CartItem item ;
  const CartCard({super.key ,required this.item});

  @override
  Widget build(BuildContext context) {
    return

      Card(
      shadowColor: Colors.black54,
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            Text(item.nameOfItem, style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 4,),
            Row(
              children: [
                Expanded(child: Text(item.price.toString())),
                Text.rich(TextSpan(text:item.rating.toString(),children: const [
                  WidgetSpan(child: Icon(Icons.star))
                ]))
              ],
            )
        ],
      )
      ,);
  }
}
