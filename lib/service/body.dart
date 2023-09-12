import 'dart:developer';

import 'package:Nestcare/service/services.dart';
import 'package:flutter/material.dart';






class body_s extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          services()

          //SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}