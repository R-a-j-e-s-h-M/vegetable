import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vegetable/presentation/cart/cart.dart';

import 'package:vegetable/presentation/farmerdetails/profiletap.dart';
import 'package:vegetable/presentation/farmerdetails/reviews.dart';

// ignore: must_be_immutable
class Farmers extends StatelessWidget {
  String farmers;
  String address;
  String district;
  String phone;

  Farmers({super.key, required this.farmers, required this.address,required this.district,required this.phone});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/mb5q_ihm1_210408.jpg",
              height: 400,
            ),
          ),
          buttonArrow(context),
          DraggableScrollableSheet(
              initialChildSize: 0.6,
              maxChildSize: 1.0,
              minChildSize: 0.6,
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 5,
                                width: 35,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Farmer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Text(
                          "District:$district",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                         Text(
                          "Phone:$phone",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfileTap(
                                           name:farmers,
                                          showFollowBottomInProfile: true),
                                    ));
                              },
                              child: const CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage("assets/images/pngwing.com.png"),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              farmers,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),

                            
                          ],
                          
                            
                        ),
                      const  SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: const Color(0xFF1FCC79),
                              child: IconButton(
                                icon: const Icon(Icons.heart_broken),
                                color: Colors.white,
                                onPressed: () {
                                
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                              height: 10,
                            ),
                          const  Expanded(
                              child:  Text(
                                "273 Likes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            MaterialButton(onPressed: (){
                                Navigator.of(context).push(PageTransition(
                                      child: Reviews(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      childCurrent: Container()));
                                    

                            },
                            color: Colors.black,
                            child:const Text("Reviews",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                          ],
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 4,
                          ),
                        ),
                        const Text(
                          "Address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          address,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 4,
                          ),
                        ),
                        const Text(
                          "Vegetables",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ingredients(context, "Tomato"),
                      ingredients(context, "Potato"),
                      ingredients(context, "Beans"),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 4,
                          ),
                        ),
                        const Text(
                          "Steps",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      steps(context, 0,  "assets/images/potato.jpg", "Potato"),
                      steps(context, 1,  "assets/images/tomato.jpg", "Tomato"),
                        steps(context, 2,  "assets/images/beans.jpg", "Beans"),
                      

                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    ));
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ingredients(BuildContext context,String vegetable) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
             const CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFFE3FFF8),
                child: Icon(
                  Icons.done,
                  size: 15,
                  color: Color(0xFF1FCC79),
                ),
              ),
             const SizedBox(
                width: 10,
              ),
              Text(
                vegetable,
                style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            
            ],
          ),
        ),
        
       const Text("out of stock")
      ],
    );
  }

  steps(BuildContext context, int index,String image,String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF2E3E5C),
            radius: 12,
            child: Text("${index + 1}"),
          ),
          Column(
            children: [
             SizedBox(
                width: 270,
                child: Text(
                  name,
                  maxLines: 3,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              
              Image.asset(
                image,
                height: 155,
                width: 270,
              ),
            
        
              MaterialButton(onPressed: (){
                                Navigator.of(context).push(PageTransition(
                                      child:const MyCartScreen(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      childCurrent: Container()));
                                    

                            },
                            color: Colors.black,
                            child:const Text("Add to cart",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),

            ],
          )
        ],
      ),
    );
  }
}
