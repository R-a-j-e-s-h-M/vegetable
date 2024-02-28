
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class Reviews extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Reviews({ Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  bool isMore = false;
  List<double> ratings = [0.1, 0.3, 0.5, 0.7, 0.9];
 
static const kAccentColor = Color(0xFFF1F1F1);
static const kWhiteColor = Color(0xFFFFFFFF);
static const kLightColor = Color(0xFF808080);
final reviewList = [
  ReviewModal(
    
    name: "Abhishek",
    rating: 3.5,
    date: "01 Jan 2024",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(

    name: "Adharsh",
    rating: 2.5,
    date: "21 Feb 2024",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    
    name: "Rohith",
    rating: 4.5,
    date: "17 Mar 2024",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
  
    name: "Rajesh",
    rating: 1.5,
    date: "12 Apr 2024",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  ReviewModal(
    
    name: "Rajesh",
    rating: 2.0,
    date: "28 May 2024",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
  
    name: "Rajesh",
    rating: 4.0,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
  
    name: "Adarsh",
    rating: 1.0,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    
    name: "Abhishek",
    rating: 3.0,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    
    name: "Ajas",
    rating: 5.0,
    date: "14 Nov 2024",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    
    name: "Rajesh",
    rating: 3.5,
    date: "14 Nov 2024",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    
    name: "Rajesh",
    rating: 3.5,
    date: "14 Nov 2024",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    
    name: "Adarsh",
    rating: 3.5,
    date: "14 Nov 2024",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    
    name: "Rohith",
    rating: 3.5,
    date: "14 Nov 2024",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kWhiteColor,
      appBar:const DefaultAppBar(
        title: "Reviews",
        child: DefaultBackButton(),
      ),
      body: SizedBox(
  
        child: Column(
          children: [
            Container(
          
              color: kAccentColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const  Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "4.5",
                              style: TextStyle(fontSize: 48.0),
                            ),
                            TextSpan(
                              text: "/5",
                              style: TextStyle(
                                fontSize: 24.0,
                                color: kLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RatingBarIndicator(
                  rating: 2.5,
                  itemCount: 5,
                  itemSize: 30.0,
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.red,
                      )),
                    const  SizedBox(height: 16.0),
                      Text(
                        "${reviewList.length} Reviews",
                        style:const TextStyle(
                          fontSize: 20.0,
                          color:Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 200.0,
                    child: ListView.builder(
                  
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Text(
                              "${index + 1}",
                              style:const TextStyle(fontSize: 18.0),
                            ),
                           const SizedBox(width: 4.0),
                          const  Icon(Icons.star, color: Colors.orange),
                          const  SizedBox(width: 8.0),
                            LinearPercentIndicator(
                              lineHeight: 6.0,
                              // linearStrokeCap: LinearStrokeCap.roundAll,
                              width: MediaQuery.of(context).size.width / 2.8,
                              animation: true,
                              animationDuration: 2500,
                              percent: ratings[index],
                              progressColor: Colors.orange,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              
              child: ListView.separated(
              
                padding:const EdgeInsets.only(bottom: 8.0, top: 8.0),
                itemCount: reviewList.length,
                itemBuilder: (context, index) {
                  return ReviewUI(
                    key:const Key("abcd"),
                    
                    name: reviewList[index].name,
                    date: reviewList[index].date,
                    comment: reviewList[index].comment,
                    rating: reviewList[index].rating,
                    onPressed: () => debugPrint("More Action $index"),
                    onTap: () => setState(() {
                      isMore = !isMore;
                    }),
                    isLess: isMore,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2.0,
                    color: kAccentColor,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ReviewUI extends StatelessWidget {
  final String  name, date, comment;
  final double rating;
  final Function onTap, onPressed;
  final bool isLess;
  const ReviewUI({
    required Key key,

    required this.name,
    required this.date,
    required this.comment,
    required this.rating,
    required this.onTap,
    required this.isLess,
    required this.onPressed,
  }) : super(key: key);
  static const kFixPadding = 16.0;
  static const kLightColor = Color(0xFF808080);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 2.0,
        bottom: 2.0,
        left: 16.0,
        right: 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              
              Expanded(
                child: Text(
                  name,
                  style:const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        const  SizedBox(height: 8.0),
          Row(
            children: [
               RatingBarIndicator(
                rating: 2.5,
                itemCount: 5,
                itemSize: 30.0,
                itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.red,
                    )),
             const SizedBox(width: kFixPadding),
              Text(
                date,
                style:const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        const  SizedBox(height: 8.0),
          GestureDetector(
            onTap: (){},
            child: isLess
                ? Text(
                    comment,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: kLightColor,
                    ),
                  )
                : Text(
                    comment,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      fontSize: 18.0,
                      color: kLightColor,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}


class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget child;
  // ignore: prefer_typing_uninitialized_variables
  final action;
  const DefaultAppBar({
    Key? key, required this.title, required this.child, this.action,
  }) : super(key: key);

  @override
  Size get preferredSize =>const Size.fromHeight(56.0);
  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    
     const kWhiteColor = Color(0xFFFFFFFF);
     const kRadius = 0.0;
    return AppBar(
      title: Text(title, style:const TextStyle(color: Colors.black)),
      centerTitle: true,
      backgroundColor: kWhiteColor,
      elevation: kRadius,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: child,
      actions: action,
    );
  }
}

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    return IconButton(
      icon:const Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}





class ReviewModal {

  final String name;
  final double rating;
  final String date;
  final String comment;
ReviewModal({
    required this.name,
    required this.rating,
    required this.date,
    required this.comment,  
    
  });

  Map<String, dynamic> toMap() {
    return {
    
      'name': name,
      'rating': rating,
      'date': date,
      "comment": comment,
     
    
    };
  }

  factory ReviewModal.fromMap(Map<String, dynamic> map) {
    return ReviewModal(
    
      name: map['name'] ?? '',
      rating: map['rating'] ?? '',
      date: map['date'] ?? '',
      comment: map['comment'] ?? '',
     
     
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModal.fromJson(String source) => ReviewModal.fromMap(json.decode(source));

  ReviewModal copyWith({
    String? image,
    String? name,
    double? rating,
    String? date,
    String? comment,
    
  
  }) {
    return ReviewModal(
      
      name: name ?? this.name,
      rating: rating ?? this.rating,
      date: date ?? this.date,
      comment: comment ?? this.comment,
    
      
      
    );
  }
}