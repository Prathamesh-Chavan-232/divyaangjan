import 'package:flutter/material.dart';

import '../../../models/requests.dart';

class RequestStatusCard extends StatelessWidget {
  const RequestStatusCard({
    @required requestWithKey,
    Key? key,
  })  : _requestWithKey = requestWithKey,
        super(key: key);
  final RequestsWithUniqueId _requestWithKey;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var textStyle = const TextStyle(fontSize: 15);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
        ),
      child: (_requestWithKey.request.status == "Approved")
          ? ListTile(
              isThreeLine: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Request : ${_requestWithKey.request.request}",
                    style: textStyle,
                  ),
                  Text("Accepted By : " + _requestWithKey.request.acceptedBy,
                      style: textStyle),
                  Text(
                      "Date : ${_requestWithKey.request.needDate.day}-${_requestWithKey.request.needDate.month}-${_requestWithKey.request.needDate.year}",
                      style: textStyle)
                ],
              ),
              subtitle: Row(
                children: const [
                  Text("Status : "),
                  Text(
                    "Approved",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name : " + _requestWithKey.request.userDetails.name),
                  Text("PRN : " + _requestWithKey.request.userDetails.prn),
                  Text("Disability : " +
                      _requestWithKey.request.userDetails.disability)
                ],
              ),
            )
          : ListTile(
              isThreeLine: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Request : ${_requestWithKey.request.request}",
                    style: textStyle,
                  ),
                  Text("Accepted By : " + _requestWithKey.request.acceptedBy,
                      style: textStyle),
                  Text(
                      "Date : ${_requestWithKey.request.needDate.day}-${_requestWithKey.request.needDate.month}-${_requestWithKey.request.needDate.year}",
                      style: textStyle)
                ],
              ),
              subtitle: Row(
                children: const [
                  Text("Status : "),
                  Text(
                    "Rejected",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name : " + _requestWithKey.request.userDetails.name),
                  Text("PRN : " + _requestWithKey.request.userDetails.prn),
                  Text("Disability : " +
                      _requestWithKey.request.userDetails.disability)
                ],
              ),
            ),
    );
  }
}
