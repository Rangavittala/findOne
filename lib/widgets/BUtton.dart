import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function ontap;

  const Button(this.text, this.ontap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.15,
        height: 55,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: ElevatedButton(
          onPressed: () {
            ontap();
          },
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              primary: Color.fromRGBO(40, 115, 161, 1.0),
              onPrimary: Colors.white),
        ),
      ),
    );
  }
}
