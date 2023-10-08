import 'package:flutter/material.dart';
import 'package:intellifarm/components/number_textfield.dart';
import 'package:intellifarm/components/password_textfield.dart';
import 'package:intellifarm/components/login_button.dart';

class FarmerLoginPage extends StatelessWidget {
  const FarmerLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Farmer Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const SizedBox(
              height: 26,
            ),
            const NumberTextfield(),
            const SizedBox(
              height: 12,
            ),
            const PasswordTextfield(),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {},
              style:
                  TextButton.styleFrom(foregroundColor: Colors.grey.shade600),
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(
              height: 6,
            ),
            const LoginButton(),
            const Spacer(),
            TextButton(
              onPressed: () {},
              style:
                  TextButton.styleFrom(foregroundColor: Colors.grey.shade600),
              child: const Text(
                'New User? Create an Account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
