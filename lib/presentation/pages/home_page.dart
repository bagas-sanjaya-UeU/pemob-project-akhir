import 'package:flutter/material.dart';

import '../../main.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';
import 'dashboard_page.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  HomePage(this.controller);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: DashboardPage(),
      selectedIndex: 0,
      controller: widget.controller,
    );
  }
}
