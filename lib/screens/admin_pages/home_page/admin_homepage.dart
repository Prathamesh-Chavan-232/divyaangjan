import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1231),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.0724),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello Admin,",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Have a great day !",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0971),
            GestureDetector(
              onTap: (() {}),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2775,
                  width: MediaQuery.of(context).size.width * 0.7897,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.2213, width:MediaQuery.of(context).size.height * 0.4836, child: Image.asset("assets/images/view_request_admin.png")),
                      const Text("View Requests", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0615),
            GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2775,
                  width: MediaQuery.of(context).size.width * 0.7897,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.2213, width:MediaQuery.of(context).size.height * 0.4836, child: Image.asset("assets/images/profile_verification_admin.png")),
                      const Text("Profile Verification", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
