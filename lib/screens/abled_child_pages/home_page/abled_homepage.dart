import 'package:flutter/material.dart';

class AbledHomePage extends StatelessWidget {
  const AbledHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1231),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello Name,",
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
                SizedBox(width: MediaQuery.of(context).size.width * 0.3387),
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.height * 0.09,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0971),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (() {}),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2775,
                      width: MediaQuery.of(context).size.width * 0.3691,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.2213,
                              width:
                                  MediaQuery.of(context).size.width * 0.4836,
                              child: Image.asset(
                                  "assets/images/view_request_admin.png")),
                          const Text(
                            "View request",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.0537),
                GestureDetector(
                  onTap: (() {}),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2775,
                      width: MediaQuery.of(context).size.width * 0.3691,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.2213,
                              width:
                                  MediaQuery.of(context).size.width * 0.4836,
                              child: Image.asset(
                                  "assets/images/view_your_credits_abled.png")),
                          const Text(
                            "View your Credits",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0323),
            GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2559,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2213,
                          width: MediaQuery.of(context).size.height * 0.4836,
                          child: Image.asset(
                              "assets/images/pair_up_abled.png")),
                      const Text(
                        "Profile Verification",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
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
