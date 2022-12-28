import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../compass/root.dart';
import '../home/root.dart';
import '../messages/root.dart';
import '../notification/root.dart';
import '../search/root.dart';
import 'widgets/bottom_nav.dart';

class RootWidget extends StatefulWidget {
  final int index;
  const RootWidget({Key? key, this.index = 2}) : super(key: key);

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  late Tabs currentTab;
  GetIt ioc = GetIt.I;
  @override
  void initState() {
    currentTab = Tabs.values[widget.index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeRootWidget(
            isCurrent: currentTab == Tabs.home,
            key: Key(Tabs.home.name),
          ),
          CompassRootWidget(
            isCurrent: currentTab == Tabs.compass,
            key: Key(Tabs.compass.name),
            index: widget.index,
          ),
          SearchRootWidget(
            isCurrent: currentTab == Tabs.search,
            key: Key(Tabs.search.name),
            index: widget.index,
          ),
          MessageRootWidget(
            isCurrent: currentTab == Tabs.message,
            key: Key(Tabs.message.name),
            index: widget.index,
          ),
          NotificationRootWidget(
            isCurrent: currentTab == Tabs.notification,
            key: Key(Tabs.notification.name),
            index: widget.index,
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(
        currentTab: currentTab,
        didSelectTab: (tab) {
          setState(() {
            currentTab = tab;
          });
        },
      ),
    );
  }
}
