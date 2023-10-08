import 'package:flutter/material.dart';

class FarmerApplyButton extends StatelessWidget {
  const FarmerApplyButton({
    Key? key,
  }) : super(key: key);

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
          primary: const Color(0xff00c39c),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'APPLY',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
