import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification_flutter_firebase/push_notification_service.dart';
import 'home_page.dart'; // Replace with your home page file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDAsrvU75GvPJeeNlMI1_xkWs7KY2Mt_wI',
          appId: '1:918373475941:android:d746e7945eca7559c0488c',
          messagingSenderId: '918373475941',
          projectId: 'push-notification-flutte-21ec9'));

  await requestNotificationPermissions();
  await getFCMToken();
  PushNotificationService().initialize();
  runApp(const MyApp());
}

Future<void> requestNotificationPermissions() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
}

Future<void> getFCMToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();
  print('FCM Token: $token');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Notification Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Replace with your home page widget
    );
  }
}
