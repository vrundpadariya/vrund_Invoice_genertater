import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 100,
            width: 150,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "   Our",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "product",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 90,
                width: 350,
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.9),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.search,
                          ),
                          Text("Search")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Icon(Icons.tune_rounded),
              ),
            ],
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
            badgeCount: 5,
            title: Text("Home"),
            icon: const Icon(
              Icons.home,
            ),
          ),
          CustomNavigationBarItem(
            title: Text("Cart"),
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
          CustomNavigationBarItem(
            title: Text("Personal Detail"),
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
              if (_currentIndex == 1) {
                Navigator.pushNamed(context, 'cart');
              } else if (_currentIndex == 2) {
                Navigator.pushNamed(context, 'fav');
              }
            },
          );
        },
        isFloating: true,
      ),
    );
  }
}
