import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/admin_request_controller.dart';
import 'request_tabs/approved.dart';
import 'request_tabs/pending.dart';
import 'request_tabs/rejected.dart';
import 'request_tabs/request.dart';

class AdminRequestsScreen extends StatelessWidget {
  const AdminRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  elevation: 0.0,
                  toolbarHeight: 80,
                  title: const Text(
                    "Requests",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                  centerTitle: true,
                  backgroundColor: const Color(0xff57B9E1),
                  bottom: PreferredSize(
                    preferredSize: _tabBar.preferredSize,
                    child: ColoredBox(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: _tabBar,
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                ChangeNotifierProvider<AdminRequestControllerModel>(
                  create: (_) => AdminRequestControllerModel(),
                  child: RequestPage(),
                ),
                ChangeNotifierProvider<AdminRequestControllerModel>(
                  create: (_) => AdminRequestControllerModel(),
                  child: PendingPage(),
                ),
                ChangeNotifierProvider<AdminRequestControllerModel>(
                  create: (_) => AdminRequestControllerModel(),
                  child: const ApprovedPage(),
                ),
                ChangeNotifierProvider<AdminRequestControllerModel>(
                  create: (_) => AdminRequestControllerModel(),
                  child: const RejectedPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TabBar get _tabBar => TabBar(
        isScrollable: true,
        unselectedLabelColor: Colors.black,
        labelStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        labelPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        indicator: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            5.0,
          ),
          color: const Color(0xff00B374),
        ),
        tabs: const [
          Tab(text: ("Request")),
          Tab(text: ("Pending")),
          Tab(text: ("Approved")),
          Tab(text: ("Rejected")),
        ]);
