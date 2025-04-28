//This page is for the Add cart

//The user will add the name of the item and its price
// Then the rating of the item will be randomly generated

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleshopingcartapp/controller.dart';
import 'package:sampleshopingcartapp/main.dart';

import '../service/model.dart';
import 'dart:math' as Math;

class AddCartPage extends StatelessWidget {
  GlobalKey<AddCartCardState> cartCardKey = GlobalKey();
   AddCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Add To List"),actions: [
        TextButton(onPressed: (){
          //We need to get the values of the cart card
          var name = cartCardKey.currentState?.nameController.text??"NoName";
          var price = double.parse(cartCardKey.currentState?.priceController.text??"0");
          var rating = cartCardKey.currentState?.rating??0;

          //We need to create our custom cart card item
          var cartItem = CartItem(id:null,nameOfItem: name,price: price,rating: rating);
          //Then we insert it to the db
          context.read<CartController>().insertCartItem(cartItem);
          //Then we pop from this page
          Navigator.pop(context);

        }, child: const Text("Submit"))
      ],),
      body: Center(
        child: AddCartCard(key: cartCardKey,),
      ),
    );
  }
}

class AddCartCard extends StatefulWidget {
  //We want our card to be able to flip and animate to the back 
  const AddCartCard({super.key});

  @override
  State<AddCartCard> createState() => AddCartCardState();
}

class AddCartCardState extends State<AddCartCard> {

  bool isFrontFacing = true;
  bool isEditable = false;


  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  int rating =5;

  late double cardWidth ;


  @override
  void initState() {

    super.initState();

  }
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
    cardWidth = MediaQuery.sizeOf(context).width*0.8;

  }

  Widget buildFrontFace(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const Text("CARD DETAILS"),
          IconButton(onPressed: (){
            setState(() {
              isEditable = !isEditable;
            });
          }, icon: Icon((isEditable == true)?Icons.check:Icons.edit))
        ],),
        const SizedBox(height:8),
         TextField(
           controller: nameController,
           enabled: isEditable,
          style: const TextStyle(fontSize:24),
          decoration: const InputDecoration(
            border:InputBorder.none ,
            hintText: "Name",
            hintStyle: TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(height:8),
        Row(
            children:[
              const Text("\$", style: TextStyle(fontSize: 30),),
              const SizedBox(width: 4,),
              Expanded(
                child: TextField(
                  controller: priceController,
                          enabled: isEditable,
                          style: const TextStyle(fontSize:18),
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Price"
                          ),
                        ),
              ),

              const SizedBox(width: 8,),
              GestureDetector(
                onTap: (){
                  if(isEditable){
                    setState(() {
                      rating = Math.Random().nextInt(5);
                    });
                  }
                },
                child:  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(rating.toString()),
                    Icon(Icons.star_border_outlined)
                  ],
                ),
              )
            ]
        )
      ],

    );
  }

  Widget buildBackFace(BuildContext context){
    return  Container(
      width: cardWidth,

      child: Text("CART ITEM",
        textAlign: TextAlign.center,
        style: TextStyle(
        fontSize: 36,

        fontWeight: FontWeight.bold
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: (){
             setState(() {
               isFrontFacing=!isFrontFacing;
             });
        }, icon: const Icon(Icons.west)),
        const SizedBox(width: 12,),
        Expanded(
          child: Container(

            width : cardWidth,


            decoration: BoxDecoration(

              gradient: LinearGradient(
                transform: GradientRotation(270.5),
                stops: [
                 0.0, 0.1,0.85,0.9
                ],
                  colors: [theme.shadowColor.withOpacity(0.1),theme.cardColor,Colors.white60,theme.shadowColor.withOpacity(0.1)]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color:Colors.black45,offset: Offset(4, 10))]
            ),
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),

            child:IndexedStack(index: (isFrontFacing  ==true)?0:1,children: [
            buildFrontFace(context),
              buildBackFace(context)
            ],)
          ),
        ),
        const SizedBox(width: 8,),
        IconButton(onPressed: (){
          setState(() {
            isFrontFacing=!isFrontFacing;
          });
        }, icon: const Icon(Icons.east)),




      ],
    );
  }
}

class AddCartFrontFace extends StatefulWidget {

  const AddCartFrontFace({super.key});

  @override
  State<AddCartFrontFace> createState() => _AddCartFrontFaceState();
}

class _AddCartFrontFaceState extends State<AddCartFrontFace> {
  bool isEditable = false;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
