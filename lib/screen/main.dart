import 'package:flutter/material.dart';
import 'package:invoice_generater/screen/detail.dart';
import 'package:invoice_generater/screen/home_page.dart';
import 'package:invoice_generater/screen/invoice.dart';
import 'package:invoice_generater/screen/splace_scree.dart';

import 'cart.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => const splash_page(),
        'home': (context) => const homescreen(),
        'details': (context) => const detailpage(),
        'cart': (context) => const cartpage(),
        'pdf': (context) => const invoice(),
      },
    ),
  );
}
