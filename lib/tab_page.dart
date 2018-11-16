import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabPageState();
  }
}

class TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  List<Tab> tabList = <Tab>[
    Tab(
      text: 'Home',
      icon: Icon(Icons.home),
    ),
    Tab(
      icon: Icon(Icons.settings),
      text: 'Setting',
    ),
    Tab(
      icon: Icon(Icons.music_video),
      text: 'Rest',
    ),
    Tab(
      icon: Icon(Icons.my_location),
      text: 'Loc',
    )
  ];

  TabController _tabController;

  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 0, length: tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello Tabs '),
          //bottom: TabBar(controller: _tabController, tabs: tabList),
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabList.map((Tab tab) {
            return Center(child: Text(tab.text));
          }).toList(),
        ),
        bottomNavigationBar: (Material(
          child: TabBar(controller: _tabController, tabs: tabList),
          color: Colors.red,
        )));
  }
}
