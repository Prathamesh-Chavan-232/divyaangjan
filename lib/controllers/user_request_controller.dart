
// class UserRequestController {
//   final _database = FirebaseDatabase.instance.ref();

//   Stream<Requests> getRequestsStream() {
//     final reqStream = _database.child('requests').orderByValue().onValue;

//     final reqStreamPublisher = reqStream.map((prn) {
//       final uniqueId =
//           Map<String, dynamic>.from((prn as dynamic).snapshot.value);
//       final requests = Map<String, dynamic>.from((uniqueId as dynamic).snapshot.value);
//       return uniqueId;
//     });
    
//     return reqStreamPublisher;
//   }
// }
