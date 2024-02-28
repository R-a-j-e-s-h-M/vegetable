import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class TrackOrder extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  TrackOrder({Key? key}) : super(key: key);


  @override
  // ignore: library_private_types_in_public_api
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  final trackOrderList = [
  TrackOrderModal(
      icon: Icons.card_travel,
      title: "Ready to Pickup", 
      subtitle: "Order from E-Commerce",
      time: "08.00"),
  TrackOrderModal(
      icon: Icons.person,
      title: "Order Processed",
      subtitle: "We are preparing your order",
      time: "09.50"),
  TrackOrderModal(
      icon: Icons.payment,
      title: "Payment Confirmed",
      subtitle: "Awaiting Confirmation",
      time: "11.30"),
  TrackOrderModal(
      icon: Icons.receipt,
      title: "Order Placed",
      subtitle: "We have received your order",
      time: "02.15"),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:const DefaultAppBar(
        title: "Track My Order",
        child: DefaultBackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Wed, 12 September",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          const  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Order ID:324445555B",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          const  Padding(
              padding:  EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: Text(
                "Orders",
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 6,
                  child: IconStepper(
                    direction: Axis.vertical,
                    enableNextPreviousButtons: false,
                    enableStepTapping: false,
                    stepColor: Colors.black,
                    activeStepBorderColor: Colors.black,
                    activeStepBorderWidth: 0.0,
                    activeStepBorderPadding: 0.0,
                    lineColor: Colors.black,
                    lineLength: 70.0,
                    lineDotRadius: 2.0,
                    stepRadius: 16.0,
                    icons:const [
                      Icon(Icons.circle, color: Colors.black),
                      Icon(Icons.check, color: Colors.white),
                      Icon(Icons.check, color: Colors.white),
                      Icon(Icons.check, color: Colors.white),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: trackOrderList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(
                        
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: ListTile(
                              contentPadding:
                                 const EdgeInsets.symmetric(vertical: 16.0),
                              leading: Icon(
                                trackOrderList[index].icon,
                                size: 48.0,
                                color: Colors.black,
                              ),
                              title: Text(
                                trackOrderList[index].title,
                                style:const TextStyle(fontSize: 18.0),
                              ),
                              subtitle: Text(
                                trackOrderList[index].subtitle,
                                style:const TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                          Text(
                            trackOrderList[index].time,
                            style:const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
                
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                 const Icon(Icons.home, size: 64.0, color: Colors.black),
                const  SizedBox(width: 32.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const Text(
                        "Delivery Address",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        "Home, Work & Other Address",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          "House No: 1234, 2nd Floor Sector 18, Silicon Valey Amerika Serikat",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}



class TrackOrderModal {

IconData icon;
  String title;
  String subtitle;
  String time;

  TrackOrderModal({required this.icon, required this.title, required this.subtitle, required this.time});

  Map<String, dynamic> toMap() {
    return {
    
      'icon': icon,
      'title': title,
      'subtitle': subtitle,
      "time": time,
     
    
    };
  }

  factory TrackOrderModal.fromMap(Map<String, dynamic> map) {
    return TrackOrderModal(
    
      icon: map['icon'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      time: map['time'] ?? '',
     
     
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackOrderModal.fromJson(String source) => TrackOrderModal.fromMap(json.decode(source));

  TrackOrderModal copyWith({
    IconData? icon,
    String? title,
    String? subtitle,
    String? time,
    
    
  
  }) {
    return TrackOrderModal(
      
      icon: icon ?? this.icon,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      time: time ?? this.time,
    
      
      
    );
  }
}
