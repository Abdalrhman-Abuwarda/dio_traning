import 'package:dio_traning/core/provider/userProvider.dart';
import 'package:dio_traning/ui/page/messenger/messenger_sscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[ChangeNotifierProvider(create: (_)=> UserProvider(), child: MyApp(),)],
     child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MessengerScreen(),
      ),
    );
  }
}
