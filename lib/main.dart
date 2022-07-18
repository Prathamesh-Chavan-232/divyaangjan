import '/wrapper.dart';
import '/models/users.dart';
import 'services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'screens/authenticate/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/admin_request_controller.dart';
import 'screens/requests_screen/admin_requests.dart';
import '/screens/authenticate/auth_pages/Startup.dart';
import 'package:divyajaan/screens/requests_screen/user_requests.dart';


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
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().userStream,
      child: MaterialApp(
        title: 'Divyangjaan',
        initialRoute: '/',
        routes: {
          '/' : (context) => const Wrapper(),
          '/welcome': (context) => const WelcomeScreen(),
          '/send_requests' : (context) => const UserRequests(),
          '/req': (context) => ChangeNotifierProvider<AdminRequestControllerModel>(
                create: (_) => AdminRequestControllerModel(),
                child: AdminRequests(),
              ),
          '/authenticate': (context) => const Auth(),
          '/admin_request': (context) =>
              ChangeNotifierProvider<AdminRequestControllerModel>(
                create: (_) => AdminRequestControllerModel(),
              ),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
