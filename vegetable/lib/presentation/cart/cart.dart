import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:vegetable/presentation/cart/cartconstraint.dart';
import 'package:vegetable/presentation/cart/checkout.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color lightBlue = Color(0xFF4C9EEB);
  static const Color darkText = Color(0xFF14171F);
  static const Color myCartBackgroundColor = Color(0xFfE5E5E5);
  static const Color inProgressColor = Color(0xFFEBB300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.maxFinite,
        color: myCartBackgroundColor,
        child: Center(
          child: Container(
            
            decoration: const BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            padding: EdgeInsets.all(20),
            width: 500,
            height: 700,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                // row of text and icon
                Row(
                  children: [
                  const  Expanded(
                      child: Center(
                        child: Text(
                          'My Cart',
                          style: TextStyle(
                              color: darkText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon:const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),

                // column of image, text and button
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyCartItemsContainer(
                        image: 'assets/images/potato.jpg',
                        itemName: 'Potato',
                        itemPrice: '50 Rs',
                        itemQuantity: '200 (gm)'),
                    MyCartItemsContainer(
                        image: 'assets/images/tomato.jpg',
                        itemName: 'Tomato',
                        itemPrice: '50 Rs',
                        itemQuantity: '100(gm)'),
                    MyCartItemsContainer(
                        image: 'assets/images/beans.jpg',
                        itemName: 'Beans',
                        itemPrice: '40 Rs',
                        itemQuantity: '100(gm)')
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                // row of text and button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // column of text
                 const   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 16, color: lightBlue),
                        ),
                        Text(
                          '120 Rs',
                          style: TextStyle(
                              color: darkText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    // button
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageTransition(
                              child: const CheckoutOnePage(),
                              type: PageTransitionType.rightToLeftWithFade,
                              childCurrent: Container()));
                        },
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                              color: backgroundColor,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
