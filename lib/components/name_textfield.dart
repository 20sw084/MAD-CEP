import 'package:flutter/material.dart';

class NameTextfield extends StatelessWidget {
  const NameTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xff00c39c), width: 2)),
          prefixIcon: const Icon(
            Icons.person_2_outlined,
            size: 30,
            color: Color(0xff00c39c),
          ),
          hintText: 'FULL NAME',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14)),
    );
  }
}
