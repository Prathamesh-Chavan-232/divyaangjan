import '/controllers/admin_request_controller.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AdminRequests extends StatelessWidget {
  final _database = FirebaseDatabase.instance.ref();

  AdminRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Consumer<AdminRequestControllerModel>(
              builder: ((context, model, child) {
                return ListView(
                  children: [
                    ...model.requestList.map((requestWithKey) => Card(
                        child: (requestWithKey.request.status == "Pending")
                            ? ListTile(
                                tileColor: Colors.green[50],
                                isThreeLine: true,
                                title: Column(
                                  children: [
                                    Text(
                                        "Requested for : ${requestWithKey.request.request}"),
                                    Text(
                                        "Status : ${requestWithKey.request.status}"),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            _database
                                                .child(
                                                    "requests/${requestWithKey.request.userDetails.prn}/${requestWithKey.id}/") // Path - {requests/prn/uniqueID/}
                                                .update({"status": "Approved"});
                                          },
                                          child: const Text("Approve")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            _database
                                                .child(
                                                    "requests/${requestWithKey.request.userDetails.prn}/${requestWithKey.id}/") // Path - {requests/prn/uniqueID/}
                                                .update({"status": "Rejected"});
                                          },
                                          child: const Text("Reject")),
                                    )
                                  ],
                                ),
                                trailing: Column(
                                  children: [
                                    Text(requestWithKey
                                        .request.userDetails.name),
                                    Text(
                                        requestWithKey.request.userDetails.prn),
                                    Text(requestWithKey
                                        .request.userDetails.disability)
                                  ],
                                ),
                              )
                            : ListTile(
                                tileColor: Colors.amber[50],
                                title: Text(
                                    "Requested for : ${requestWithKey.request.request}"),
                                subtitle: Row(
                                  children: [
                                    const Text("Status : "),
                                    (requestWithKey.request.status ==
                                            "Approved")
                                        ? const Text(
                                            "Approved",
                                            style:
                                                TextStyle(color: Colors.green),
                                          )
                                        : const Text(
                                            "Rejected",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                  ],
                                ),
                                trailing: Column(
                                  children: [
                                    Text(requestWithKey
                                        .request.userDetails.name),
                                    Text(
                                        requestWithKey.request.userDetails.prn),
                                    Text(requestWithKey
                                        .request.userDetails.disability)
                                  ],
                                ),
                              )))
                  ],
                );
              }),
            )),
      ),
    );
  }
}
