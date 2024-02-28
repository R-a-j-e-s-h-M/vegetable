

import 'package:flutter/material.dart';


// ignore: must_be_immutable
class MyCartItemsContainer extends StatelessWidget {
  MyCartItemsContainer(
      {Key? key,
      required this.image,
      required this.itemName,
      required this.itemPrice,
      required this.itemQuantity})
      : super(key: key);
  String image;
  String itemName;
  String itemPrice;
  String itemQuantity;
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color lightBlue = Color(0xFF4C9EEB);
  static const Color darkText = Color(0xFF14171F);
  static const Color myCartBackgroundColor = Color(0xFfE5E5E5);
  static const Color inProgressColor = Color(0xFFEBB300);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.all(25),
      //margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //a  row of image and text
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Image(fit: BoxFit.cover, image: AssetImage(image),height: 50,width: 50,)),
             const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Text(
                    itemName,
                    style:const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                const  SizedBox(
                    height: 5,
                  ),
                  Text(
                    itemPrice,
                    style: const TextStyle(
                      color: darkText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ],
          ),
          // button
          Container(
            padding:const EdgeInsets.all(16),
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color:Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               const Icon(
                  Icons.remove,
                  size: 20,
                  color: Colors.black,
                ),
                Text(
                  itemQuantity,
                  style:const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
               const Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}