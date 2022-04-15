class MyUser
{
  final String userId;
  final String? userName;
  final String? prn;
  MyUser({this.prn,this.userName,required this.userId,});


  Future requestAid() async {

    /* TODO: Create a list of requests
             Send the requests to admin
  * */

    /*
    *  how to send data to admin?
    *  User -> requests <- Admin
    *  Solution - create Collection for Requests
    *     - List of requests
    *     - For each request - have accept & reject pending (-1,0,1)
    *     - PRN number & student name, disability {Object of user}
    */
  }

  String status()   {
    return "request-status";
  }

}

/*
* Setup Realtime database
    - Make requests collection
*   Make Admin class to receive request & approve

* Add Check in login / sign-up form
*   Make User class to send request
* * * */