import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home/drawer_menu.dart';
import 'constants.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key/*, required this.title*/});

  //final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color4),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
    );
  }
}
