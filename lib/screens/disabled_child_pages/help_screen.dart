import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/faqs_controller.dart';
import 'help_tabs/faqs.dart';
import 'help_tabs/feedback.dart';
import 'help_tabs/whats_new.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  elevation: 0.0,
                  toolbarHeight: 80,
                  title: const Text("Requests"),
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
                ChangeNotifierProvider<FAQsController>(
                  create: (_) => FAQsController(),
                  child: FAQsScreen(),
                ),
                FeedbackScreen(),
                WhatsNewScreen(),
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
        labelPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        indicator: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            5.0,
          ),
          color: const Color(0xff00B374),
        ),
        tabs: const [
          Tab(text: ("   FAQs   ")),
          Tab(text: (" Feedback ")),
          Tab(text: ("What's New")),
        ]);
