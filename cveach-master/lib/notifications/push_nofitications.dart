import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void firebaseCloudMessaging_Listeners() {

    _firebaseMessaging.getToken().then((token){
      print(token);
    });

    _firebaseMessaging.configure(
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
  }
}