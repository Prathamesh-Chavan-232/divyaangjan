import '/models/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/admin_request_controller.dart';
import 'screens/abled_child_pages/home_page/abled_homepage.dart';
import 'screens/abled_child_pages/requests_screen.dart';
import 'screens/admin_pages/home_page/admin_homepage.dart';
import 'screens/admin_pages/requests_screen.dart';
import 'screens/admin_pages/verification_admin.dart';
import 'screens/disabled_child_pages/help_screen.dart';
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
        initialRoute: '/admin_request',
        routes: {
          '/':(context) => const AdminSideVerification(),
          '/help':(context) => const HelpScreen(),
          '/abled_request':(context) => ChangeNotifierProvider<AdminRequestControllerModel>(
                create: (_) => AdminRequestControllerModel(),
                child: const AbledStudentRequestsScreen(),
              ),
          '/authenticate': (context) => const Auth(),
          '/admin_request':(context) => ChangeNotifierProvider<AdminRequestControllerModel>(
                create: (_) => AdminRequestControllerModel(),
                child: const AdminRequestsScreen(),
              ),
          '/admin_homepage':(context) => const AdminHomePage(),
          '/abled_homepage':(context) => const AbledHomePage(),
          '/admin_verification':(context) => const AdminSideVerification(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
