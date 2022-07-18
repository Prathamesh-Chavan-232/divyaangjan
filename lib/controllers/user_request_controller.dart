import 'package:divyajaan/models/requests.dart';
import 'package:firebase_database/firebase_database.dart';

class UserRequestController {
  final _database = FirebaseDatabase.instance.ref();

  void createRequest(Map<String, dynamic> singleRequest) {
    final reqStream = _database.child('requests');
    reqStream.child('1032201576').push().update(singleRequest);
  }

  Stream<List<Requests>> requestsStream() {
    final reqStream = _database.child('requests').orderByValue().onValue;

    final reqStreamPublisher = reqStream.map((prn) {
      final requestsMap =
          Map<String, dynamic>.from((prn as dynamic).snapshot.value);
      final requestsList = requestsMap.entries.map((uniqueId) {
        return Requests.fromRTDB(Map<String, dynamic>.from((uniqueId as dynamic).snapshot.value));
      }).toList();
      return requestsList;
    });
    return reqStreamPublisher;
  }
}
