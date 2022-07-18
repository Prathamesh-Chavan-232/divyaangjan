import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../models/requests.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    Key? key,
    required DatabaseReference database,
    required RequestsWithUniqueId requestWithKey,
  })  : _database = database,
        _requestWithKey = requestWithKey,
        super(key: key);

  final DatabaseReference _database;
  final RequestsWithUniqueId _requestWithKey;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    const textStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
        ),
        child: (_requestWithKey.request.acceptedBy == "")
            ? Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: ExpansionTile(
                  iconColor: const Color(0xffEF6B2D),
                  textColor: const Color(0xffEF6B2D),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Requested : ${_requestWithKey.request.request}",
                          style: textStyle),
                      Text(
                          "Date : ${_requestWithKey.request.needDate.day}-${_requestWithKey.request.needDate.month}-${_requestWithKey.request.needDate.year}",
                          style: textStyle),
                    ],
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Color(0xffEF6B2D)),
                        onPressed: () async {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Request Accepted"),
                            duration: Duration(seconds: 1),
                          ));
                          await Future.delayed(const Duration(seconds: 1));
                          _database
                              .child(
                                  "requests/${_requestWithKey.request.userDetails.prn}/${_requestWithKey.id}/") // Path - {requests/prn/uniqueID/}
                              .update({"acceptedBy": "Dummy 10322xxxx"});
                        },
                        child: const Text("Accept")),
                  ),
                  children: [
                    ListTile(
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Name : " +
                                  _requestWithKey.request.userDetails.name,
                              style: textStyle),
                          Text("PRN : " + _requestWithKey.request.userDetails.prn,
                              style: textStyle),
                        ],
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              "Disability : " +
                                  _requestWithKey.request.userDetails.disability,
                              style: textStyle),
                          Text(
                              "Date : ${_requestWithKey.request.needDate.day}-${_requestWithKey.request.needDate.month}-${_requestWithKey.request.needDate.year}",
                              style: textStyle),
                        ],
                      ),
                    ),
                  ],
                ),
            )
            : null);
  }
}
