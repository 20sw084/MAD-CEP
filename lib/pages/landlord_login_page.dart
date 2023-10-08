import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intellifarm/pages/landlord_signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_service.dart';
import 'add_land_page.dart';

class LandlordLoginPage extends StatefulWidget {
  const LandlordLoginPage({Key? key}) : super(key: key);

  @override
  State<LandlordLoginPage> createState() => _LandlordLoginPageState();
}

class _LandlordLoginPageState extends State<LandlordLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  AuthService authService = AuthService();

  signIn() async {
    final User? user = await authService.signIn(
      _email.text,
      _password.text,
    );
    if (user != null) {
      log("Sign In Successful");
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('name', "Signed In");
      // SchedulerBinding.instance!.addPostFrameCallback((_) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       content: Text(
      //         "Sign In Successful",
      //       ),
      //     ),
      //   );
      // });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform sign-in logic here, e.g., authenticate user
      // You can replace this with your authentication code
      log('Email: ${_email.text}');
      // print('Password: $_password');
      signIn();
      // Navigate to the next screen or perform other actions
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Landlord Login Page'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const SizedBox(
                  height: 26,
                ),
                TextFormField(
                  controller: _email,
                  // validator: (value) {
                  //   if (value!.isNotEmpty) {
                  //     return "OK";
                  //   }
                  // },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xff00c39c),
                        width: 2,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.phone_android_sharp,
                      size: 30,
                      color: Color(0xff00c39c),
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _password,
                  // validator: (value) {
                  //   if (value!.isNotEmpty) {
                  //     return "OK";
                  //   }
                  // },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xff00c39c),
                        width: 2,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      size: 30,
                      color: Color(0xff00c39c),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
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
                      _submitForm();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddLand(),
                        ),
                      );
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
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LandlordSignUpPage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.grey.shade600),
                  child: const Text(
                    'New User? Create an Account',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
