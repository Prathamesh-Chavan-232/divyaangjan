import 'dart:async';
import 'dart:convert';

import '/models/requests.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class AdminRequestControllerModel extends ChangeNotifier{
  final _database = FirebaseDatabase.instance.ref();
  List<RequestsWithUniqueId> _requestList = [];

  List<RequestsWithUniqueId> get requestList => _requestList;
  
  late StreamSubscription<DatabaseEvent> _requestStream;

  AdminRequestControllerModel(){
    __listentoRequests();
  }

  void __listentoRequests(){
    _database.child("requests").orderByValue().onValue.listen((event) {
      _requestList = [];
      // Saving all data as a Map under Individual PRN numbers - Like {103xxxxxx6 : {uniqueId1 : {request : "", status : "", userDetails{disability : "", name : "", prn : ""}}}, {uniqueId : {request : "", status : "", userDetails{disability : "", name : "", prn : ""}}}}
      final allPrn = (jsonDecode(jsonEncode(event.snapshot.value))as Map<String, dynamic>);
      // Value is all request under one prn with different unique ids Like - uniqueId1 : {request : "", status : "", userDetails{disability : "", name : "", prn : ""}}}, {uniqueId : {request : "", status : "", userDetails{disability : "", name : "", prn : ""}}}
      allPrn.forEach((key, value) {
        // singleRequest is request under one uniqueId (id) - Like {request : "", status : "", userDetails{disability : "", name : "", prn : ""}}}
        (value as Map<String, dynamic>).forEach((id, singleRequest){
          _requestList.add(RequestsWithUniqueId.fromvalues(Requests.fromMap(singleRequest), id)); // Converting singleRequest from Map to object of type request
        });
      });
    notifyListeners();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _requestStream.cancel();
    super.dispose();
  }
}