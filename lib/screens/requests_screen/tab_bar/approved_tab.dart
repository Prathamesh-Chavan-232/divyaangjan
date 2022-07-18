import 'package:divyajaan/controllers/user_request_controller.dart';
import 'package:divyajaan/models/requests.dart';
import 'package:flutter/material.dart';

class ApprovedTab extends StatefulWidget {
  const ApprovedTab({Key? key}) : super(key: key);

  @override
  _ApprovedTabState createState() => _ApprovedTabState();
}

class _ApprovedTabState extends State<ApprovedTab> {
  late List<Requests> approvedRequestList = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          StreamBuilder(
              stream: UserRequestController().requestsStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final requests = snapshot.data as List<Requests>;
                  final List<ListTile> tilesList = [];
                  requests.map((req) {
                    if (req.status == "approved") {
                      approvedRequestList.add(req);
                    }
                    tilesList.addAll(approvedRequestList.map((req) {
                      return ListTile(
                          title: Text(req.request),
                          subtitle: Text(req.userDetails.name));
                    }));
                  });

                  return Expanded(
                      child: ListView(
                    children: tilesList,
                  ));
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
