import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../constant.dart';
import 'loadSchool.dart';



class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  _HomeScreenState createState() => new _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  TextEditingController textSearchController = TextEditingController();
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  width: double.infinity,
                  height: 250.0,
                  padding: EdgeInsets.only(bottom: 50.0),
                  decoration: BoxDecoration(
                    color: kYellow,
                    image: DecorationImage(
                      image: AssetImage("assets/background/education.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.black12.withOpacity(.0),
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {},
                        ),
                        actions: [
                          IconButton(
                            icon: Icon(Icons.notification_important),
                            iconSize: 30,
                            onPressed: () {},
                          )
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          "Find your best teacher job",
                          style: kTitleStyle2.copyWith(color: Colors.red),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        margin: EdgeInsets.symmetric(horizontal: 18.0),
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white.withOpacity(.9),
                        ),
                        child: TextField(
                          controller: textSearchController,
                          cursorColor: kBlack,
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: kHintStyle,
                            border: InputBorder.none,
                            icon: IconButton(
                              onPressed: (){
                                String textToSend = textSearchController.text;
                                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>LoadSchool(textToSend)));

                              },
                              icon: Icon(Icons.search),
                              color: kGrey,
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),

            ],
          ),
        ),
      ),
    );
  }
  void firebaseCloudMessaging_Listeners() {

    firebaseMessaging.getToken().then((token){
      print('Token:'+token);
    });

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
    firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

  }

}

