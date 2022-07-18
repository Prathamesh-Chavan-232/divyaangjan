import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../models/requests.dart';

class PendingRequestCard extends StatelessWidget {
  const PendingRequestCard({
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
        elevation: 15,
        shadowColor: Colors.black,
        child: (_requestWithKey.request.status == "Pending")
            ? ExpansionTile(
                iconColor: const Color(0xffEF6B2D),
                textColor: const Color(0xffEF6B2D),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Request: ${_requestWithKey.request.request}",
                        style: textStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Student Name: ${_requestWithKey.request.userDetails.name}",
                        style: textStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                          "Date : ${_requestWithKey.request.needDate.day}-${_requestWithKey.request.needDate.month}-${_requestWithKey.request.needDate.year}",
                          style: textStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                          "Accepted By: ${_requestWithKey.request.acceptedBy}",
                          style: textStyle),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff00B374)),
                        onPressed: () async {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Request Approved"),
                            duration: Duration(seconds: 1),
                          ));
                          await Future.delayed(const Duration(seconds: 1));
                          _database
                              .child(
                                  "requests/${_requestWithKey.request.userDetails.prn}/${_requestWithKey.id}/") // Path - {requests/prn/uniqueID/}
                              .update({"status": "Approved"});
                        },
                        child: const Text("Approve"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffEF6B2D)),
                          onPressed: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Request Rejected"),
                                duration: Duration(seconds: 1),
                              ),
                            );
                            await Future.delayed(const Duration(seconds: 1));
                            _database
                                .child(
                                    "requests/${_requestWithKey.request.userDetails.prn}/${_requestWithKey.id}/") // Path - {requests/prn/uniqueID/}
                                .update({"status": "Rejected"});
                          },
                          child: const Text("Reject")),
                    )
                  ],
                ),
                children: [
                  ListTile(
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : " + _requestWithKey.request.userDetails.name,
                          style: textStyle,
                        ),
                        Text(
                          "PRN : " + _requestWithKey.request.userDetails.prn,
                          style: textStyle,
                        ),
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
              )
            : null);
  }
}
