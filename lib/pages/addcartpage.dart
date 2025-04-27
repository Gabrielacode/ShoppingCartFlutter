//This page is for the Add cart

//The user will add the name of the item and its price
// Then the rating of the item will be randomly generated

import 'package:flutter/material.dart';

import '../service/model.dart';

class AddCartPage extends StatelessWidget {
  const AddCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Add List"),actions: [
        TextButton(onPressed: (){}, child: const Text("Submit"))
      ],),
      body: Center(
        child: AddCartCard(),
      ),
    );
  }
}

class AddCartCard extends StatefulWidget {
  //We want our card to be able to flip and animate to the back 
  const AddCartCard({super.key});

  @override
  State<AddCartCard> createState() => _AddCartCardState();
}

class _AddCartCardState extends State<AddCartCard> {
  bool isFrontFacing = false;
  bool isEditable = false;

  CartItem itemToBedded = CartItem();


  Widget buildFrontFace(BuildContext context){
    return Column(
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const Text("CARD DETAILS"), 
          IconButton(onPressed: (){}, icon: Icon(Icons.edit))
        ],),
        SizedBox(height: 4,),
        const Text("Name"),
        const SizedBox(height:4),
        const TextField(
          style: TextStyle(fontSize:24),
        ),
        const SizedBox(height:4),
        const Row(
            children:[
              Column(
                  children:[
                    Text("Price"),
                    Flexible(
                      child: TextField(
                        style: TextStyle(fontSize:18),
                      ),
                    ),

                  ]
              ),
              SizedBox(width: 4,),
              Row(
                children: [
                  Text("5"),
                  Icon(Icons.star_border_outlined)
                ],
              )
            ]
        )
      ],

    );
  }
  Widget buildBackFace(BuildContext context){
    return const Center(
      child: Text("CART ITEM", style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold
      ),),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){

        }, icon: const Icon(Icons.west)),
        const SizedBox(width: 8,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color:Colors.black45,offset: Offset(4, 10))]
          ),
          padding: const EdgeInsets.all(12),
          child:(isFrontFacing)?buildFrontFace(context):buildBackFace(context)
        )



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
