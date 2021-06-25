import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpperUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipRRect(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.white,
              // Color.fromRGBO(202, 202, 202, 1.0),
              Color.fromRGBO(40, 115, 161, 1.0)
              // Color.fromRGBO(1, 67, 88, 1.0)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35.0),
              bottomRight: Radius.circular(35)),
        ),
        /* Positioned(
                    bottom: 200,
                    left: 90,
                    child: Text(
                      'MUSOPATHY',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 22.0,
                          letterSpacing: 4,
                          color: Colors.black),
                    ),
                  ),*/
        Positioned(
            bottom: 170,
            left: 90,
            child: Text(
              'TONATION',
              style: GoogleFonts.poiretOne(
                textStyle: TextStyle(
                    letterSpacing: 2,
                    color: Color.fromRGBO(1, 67, 88, 1.0),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            )),
        Positioned(
          bottom: 140,
          left: 90,
          child: Text(
            'BREATHING',
            style: GoogleFonts.poiretOne(
                textStyle: TextStyle(
                    letterSpacing: 2,
                    color: Color.fromRGBO(1, 67, 88, 1.0),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Positioned(
          bottom: 110,
          left: 90,
          child: Text(
            'TECHNIQUES',
            style: GoogleFonts.poiretOne(
                textStyle: TextStyle(
                    letterSpacing: 2, color: Color.fromRGBO(1, 67, 88, 1.0)),
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          bottom: -50,
          right: -80,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.7,
            child: ClipRRect(
              child: Image(
                image: AssetImage('assets/images/meditatingman.png'),
              ),
            ),
          ),
        )
      ],
      clipBehavior: Clip.antiAlias,
    );
  }
}
