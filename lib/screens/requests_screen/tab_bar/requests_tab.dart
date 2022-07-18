import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RequestsTab extends StatefulWidget {
  const RequestsTab({Key? key}) : super(key: key);

  @override
  _RequestsTabState createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab> {
  final _database = FirebaseDatabase.instance.ref();
  String reqName = "request";
  Map<String, dynamic> singleRequest = {};
  final List<String> requestsList = [
    "Hand writer",
    "Orator",
    "Notes",
    "Extra time",
    "Help to reach Exam center"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, i) => _buildListTile(i),
                separatorBuilder: (_, i) => const SizedBox(height: 15),
                itemCount: requestsList.length),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            color: Colors.grey[400],
            child: Center(
              child: _submitButton(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListTile(int i) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Text(
              requestsList[i],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _selectButton(i),
        ],
      ),
      height: 120,
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(color: Colors.grey),
    );
  }

  Widget _selectButton(int i) {
    return SizedBox(
      width: 30,
      child: TextButton(
        onPressed: () {
          setState(() {
            reqName = requestsList[i];
            singleRequest = {
              'title': reqName,
              'status': "pending",
              'userDetails': {
                'Name': "Prathamesh",
                'prn': 1032201576,
              }
            };
          });
        },
        child: const CircleAvatar(
          radius: 10,
          backgroundColor: Colors.white,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      ),
    );
  }

  ElevatedButton _submitButton() {
    return ElevatedButton(
      onPressed: () {
        final reqStream = _database.child('requests');
        reqStream.child('1032201576').push().update(singleRequest);
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: const Text(
            "SUBMIT",
            style: TextStyle(color: Colors.black, fontSize: 16),
          )),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey),
      ),
    );
  }
}
