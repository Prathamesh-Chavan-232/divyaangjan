import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'tab_bar/approved_tab.dart';
import 'tab_bar/rejected_tab.dart';
import 'tab_bar/requests_tab.dart';
import 'tab_bar/pending_tab.dart';

class UserRequests extends StatefulWidget {
  const UserRequests({Key? key}) : super(key: key);

  @override
  _UserRequestsState createState() => _UserRequestsState();
}

class _UserRequestsState extends State<UserRequests> {
  final _database = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: (() => Navigator.pushNamed(context, '/req')),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0.3)),
                    ),
                    child: const Text("admin side"),
                  ),
                )
              ],
              backgroundColor: Colors.grey[400],
              bottom: const TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black26,
                tabs: [
                  Tab(text: "Request"),
                  Tab(text: "Pending"),
                  Tab(text: "Approved"),
                  Tab(text: "Rejected"),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                RequestsTab(),
                PendingTab(),
                ApprovedTab(),
                RejectedTab(),
              ],
            )));
  }
}
