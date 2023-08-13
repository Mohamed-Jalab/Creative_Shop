import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final db = FirebaseFirestore.instance;
  // db.collection("chats").withConverter(fromFirestore: m, toFirestore: (Model model, options) => model.tofirestore,).add(data)
  // db
  // .collection("users")
  // .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore).where("email",isEqualTo: "mouahmmed@gamil.com")
  // .get();
  // var id;
  // await db
  //     .collection("test")
  //     .add({"name": "mahmoud"}).then((value) => id = value.id);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
