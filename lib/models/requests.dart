import 'dart:convert';

/* Format of data coming from RealTime Database
  {
    request : "",
    status : "", - Pending, Approved, Rejected
    userDetails{
      disability : "",
      name : "",
      prn : ""
    }
  }
*/

class RequestsWithUniqueId {
  String id;
  Requests request;
  RequestsWithUniqueId({
    required this.id,
    required this.request,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'requests': request.toMap(),
    };
  }

  factory RequestsWithUniqueId.fromvalues(Requests requests, id) {
    return RequestsWithUniqueId(
      id: id ?? '',
      request: requests,
    );
  }
}

class Requests {
  String request;
  String status; // Pending, Approved, Rejected
  UserDetails userDetails;
  Requests({
    required this.request,
    required this.status,
    required this.userDetails,
  });

  Requests copyWith({
    String? request,
    String? status,
    UserDetails? userDetails,
  }) {
    return Requests(
      request: request ?? this.request,
      status: status ?? this.status,
      userDetails: userDetails ?? this.userDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'request': request,
      'status': status,
      'userDetails': userDetails.toMap(),
    };
  }

  factory Requests.fromMap(Map<String, dynamic> map) {
    return Requests(
      request: map['request'] ?? '',
      status: map['status'] ?? '',
      userDetails: UserDetails.fromMap(map['userDetails']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Requests.fromJson(String source) =>
      Requests.fromMap(json.decode(source));

  @override
  String toString() =>
      'Requests(request: $request, status: $status, userDetails: $userDetails)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Requests &&
        other.request == request &&
        other.status == status &&
        other.userDetails == userDetails;
  }

  @override
  int get hashCode => request.hashCode ^ status.hashCode ^ userDetails.hashCode;
}

class UserDetails {
  String disability;
  String name;
  String prn;
  UserDetails({
    required this.disability,
    required this.name,
    required this.prn,
  });

  UserDetails copyWith({
    String? disability,
    String? name,
    String? prn,
  }) {
    return UserDetails(
      disability: disability ?? this.disability,
      name: name ?? this.name,
      prn: prn ?? this.prn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'disability': disability,
      'name': name,
      'prn': prn,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      disability: map['disability'] ?? '',
      name: map['name'] ?? '',
      prn: map['prn'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserDetails(disability: $disability, name: $name, prn: $prn)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDetails &&
        other.disability == disability &&
        other.name == name &&
        other.prn == prn;
  }

  @override
  int get hashCode => disability.hashCode ^ name.hashCode ^ prn.hashCode;
}
