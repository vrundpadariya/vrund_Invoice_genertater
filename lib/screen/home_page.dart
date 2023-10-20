import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            width: 200,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Our",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Product",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: Colors.orangeAccent,
        strokeColor: Color(0x300c18fb),
        unSelectedColor: Colors.grey[600],
        backgroundColor: Colors.white,
        borderRadius: Radius.circular(20.0),
        items: [
          CustomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
