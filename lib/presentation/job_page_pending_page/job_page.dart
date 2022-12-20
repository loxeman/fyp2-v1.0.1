import 'package:flutter/material.dart';
import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/core/utils/color_constant.dart';
import 'package:fyp2/presentation/job_page_pending_page/job_page_completed.dart';
import 'package:fyp2/presentation/job_page_pending_page/job_page_ongoing.dart';
import 'package:fyp2/presentation/job_page_pending_page/job_page_pending_page.dart';

class JobPage extends StatelessWidget{
  const JobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: ColorConstant.gray900,
          title: const AppBarTitle(
            title: 'Jobs',
          ),
          bottom: const TabBar(
              indicatorColor: Colors.indigo,
              indicatorWeight: 5,
              tabs: [
                RepeatedTab(label: 'Pending'),
                RepeatedTab(label: 'Ongoing'),
                RepeatedTab(label: 'Completed')
              ]),
        ),
        body:
        TabBarView(
            children: [
              JobPagePendingPage(),
              JobPageOngoingPage(),
              JobPageCompletedPage(),
            ]),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
