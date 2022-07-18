import 'package:divyajaan/controllers/user_request_controller.dart';
import 'package:divyajaan/models/requests.dart';
import 'package:flutter/material.dart';

class PendingTab extends StatefulWidget {
  const PendingTab({Key? key}) : super(key: key);

  @override
  _PendingTabState createState() => _PendingTabState();
}

class _PendingTabState extends State<PendingTab> {
  late List<Requests> pendingRequestList = [];
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
                    if (req.status == "pending") {
                      pendingRequestList.add(req);
                    }
                    tilesList.addAll(pendingRequestList.map((req) {
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
