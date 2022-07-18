import '../../../controllers/admin_request_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../widgets/RequestStatusCard.dart';

class RejectedPage extends StatelessWidget {

  const RejectedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: 
          Consumer<AdminRequestControllerModel>(
            builder: ((context, model, child) {
              return ListView(
                children: [
                  ...model.requestList.map((requestWithKey) => Padding(
                    padding : EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.008),
                    child: (requestWithKey.request.status == "Rejected")?RequestStatusCard(requestWithKey: requestWithKey,): null
                  ))
                ],
              );
            }),
          )
        ),
      ),
    );
  }
}