import 'package:flutter/material.dart';
import 'package:intellifarm/pages/add_land_page.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: const Color(0xff00c39c),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff00c39c),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddLand(),),);
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'LOGIN',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
