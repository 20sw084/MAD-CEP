import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intellifarm/pages/add_land_page.dart';
import 'package:intellifarm/pages/landlord_login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String name = '';
  @override
  void initState() {
    getName();
    super.initState();
  }

  void getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString('name') ?? 'empty';
    log(name.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (name == 'empty' || name == null) {
      return const LandlordLoginPage();
    } else {
      return const AddLand();
    }
  }
}
