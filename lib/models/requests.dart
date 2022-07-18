import 'dart:convert';

/* Format of data coming from RealTime Database
  {
    request : "",
    status : "", - Pending, Approved, Rejected
    needDate : "",
    acceptedBy : "",
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
  String acceptedBy;
  DateTime needDate;
  UserDetails userDetails;
  Requests({
    required this.request,
    required this.status,
    required this.acceptedBy,
    required this.needDate,
    required this.userDetails,
  });

  Requests copyWith({
    String? request,
    String? status,
    String? acceptedBy,
    DateTime? needDate,
    UserDetails? userDetails,
  }) {
    return Requests(
      request: request ?? this.request,
      status: status ?? this.status,
      acceptedBy: acceptedBy ?? this.acceptedBy,
      needDate: needDate ?? this.needDate,
      userDetails: userDetails ?? this.userDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'request': request,
      'status': status,
      'acceptedBy': acceptedBy,
      'needDate': needDate.toString(),
      'userDetails': userDetails.toMap(),
    };
  }

  factory Requests.fromMap(Map<String, dynamic> map) {
    return Requests(
      request: map['request'] ?? '',
      status: map['status'] ?? '',
      acceptedBy: map['acceptedBy'] ?? '',
      needDate: DateTime.parse(map['needDate']),
      userDetails: UserDetails.fromMap(map['userDetails']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Requests.fromJson(String source) =>
      Requests.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Requests(request: $request, status: $status, acceptedBy: $acceptedBy, needDate: $needDate, userDetails: $userDetails)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Requests &&
      other.request == request &&
      other.status == status &&
      other.acceptedBy == acceptedBy &&
      other.needDate == needDate &&
      other.userDetails == userDetails;
  }

  @override
  int get hashCode {
    return request.hashCode ^
      status.hashCode ^
      acceptedBy.hashCode ^
      needDate.hashCode ^
      userDetails.hashCode;
  }
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
