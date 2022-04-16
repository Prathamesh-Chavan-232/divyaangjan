import 'package:divyajaan/screens/admin_requests.dart';

import '/models/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/admin_request_controller.dart';
import 'services/auth_service.dart';
import '/authenticate/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().userStream,
      child: MaterialApp(
        title: 'Divyangjaan',
        routes: {
          '/':(context) => ChangeNotifierProvider<AdminRequestControllerModel>(create: (_) => AdminRequestControllerModel(), child: AdminRequests(),),
          '/authenticate': (context) => const Auth(),
          '/admin_request':(context) => ChangeNotifierProvider<AdminRequestControllerModel>(create: (_) => AdminRequestControllerModel(), child: AdminRequests(),),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
