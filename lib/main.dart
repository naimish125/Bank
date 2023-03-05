
import 'package:flutter/material.dart';

import 'bank.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => Home()
        },
      )
  );
}