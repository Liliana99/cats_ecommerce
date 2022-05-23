import 'package:flutter/material.dart';

class TextColor {
  Widget textColor(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Marialiji',
            style: TextStyle(
                fontFamily: 'Pacifico', fontSize: 18, color: Colors.red[900]),
          ),
          Text(
            'D',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            'e',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 19,
              color: Colors.red[900],
            ),
          ),
          Text(
            'veloper',
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
