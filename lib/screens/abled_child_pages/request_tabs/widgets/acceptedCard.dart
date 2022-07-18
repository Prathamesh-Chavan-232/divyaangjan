import 'package:flutter/material.dart';

import '../../../../models/requests.dart';

class AcceptedCard extends StatelessWidget {
  const AcceptedCard({Key? key, required RequestsWithUniqueId requestWithKey})
      : _requestWithKey = requestWithKey,
        super(key: key);

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
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                  child: Text("Request : ${_requestWithKey.request.request}",
                      style: textStyle),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                  child: Text(
                      "Date : ${_requestWithKey.request.needDate.day}-${_requestWithKey.request.needDate.month}-${_requestWithKey.request.needDate.year}",
                      style: textStyle),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                  child: Text(
                      "Name : " + _requestWithKey.request.userDetails.name,
                      style: textStyle),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                  child: Text(
                      "PRN : " + _requestWithKey.request.userDetails.prn,
                      style: textStyle),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                  child: Text(
                      "Disability : " +
                          _requestWithKey.request.userDetails.disability,
                      style: textStyle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
