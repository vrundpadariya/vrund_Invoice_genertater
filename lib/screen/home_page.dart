import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../uitiles/Globals.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

int? dropdownvalue;
int start = 0;
int end = 70000;

class _homescreenState extends State<homescreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              children: [
                DropdownButton(
                  value: dropdownvalue,
                  hint: Text("Select catagory..."),
                  items: Global.allProducts.map((e) {
                    return DropdownMenuItem(
                        value: Global.allProducts.indexOf(e),
                        child: Text("${e['categoryName']}"));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      dropdownvalue = val!;
                    });
                  },
                ),
                Visibility(
                  visible: (dropdownvalue != null) ? true : false,
                  child: ActionChip(
                    elevation: 0,
                    label: const Row(
                      children: [
                        Icon(
                          Icons.clear,
                          size: 15,
                        ),
                        Text("clear"),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        dropdownvalue = null;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: Visibility(
                visible: (dropdownvalue != null) ? true : false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Text('From'),
                          Text(
                            "RS.$start",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: RangeSlider(
                        values: RangeValues(start.toDouble(), end.toDouble()),
                        min: 0,
                        max: 70000,
                        onChanged: (val) {
                          setState(() {
                            start = val.start.toInt();
                            end = val.end.toInt();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Text('To'),
                          Text(
                            "RS.$end",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Column(
                  children: Global.allProducts.map((e) {
                    List data = e['categoryProducts'];
                    return (dropdownvalue == null)
                        ? Container(
                            alignment: Alignment.centerLeft,
                            height: 450,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${e['categoryName']}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ...e['categoryProducts'].map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                'details',
                                                arguments: e);
                                          },
                                          child: Container(
                                            height: 370,
                                            width: 230,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.grey,
                                              ),
                                              boxShadow: const <BoxShadow>[
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            margin: EdgeInsets.only(
                                                right: 25, bottom: 25),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          "${e['thumbnail']}",
                                                        ),
                                                      ),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .vertical(
                                                        top:
                                                            Radius.circular(20),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      height: 30,
                                                      width: 60,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15),
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${e['discount']} %",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${e['name']}",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${e['treading']}",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Rs.${e['price']}",
                                                          style: TextStyle(
                                                            fontSize: 22,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : (dropdownvalue == Global.allProducts.indexOf(e))
                            ? Container(
                                alignment: Alignment.centerLeft,
                                height: 450,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${e['categoryName']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ...e['categoryProducts'].map((e) {
                                            return (e['price'] >= start &&
                                                    e['price'] <= end)
                                                ? GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pushNamed('details',
                                                              arguments: e);
                                                    },
                                                    child: Container(
                                                      height: 370,
                                                      width: 230,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          width: 1,
                                                          color: Colors.grey,
                                                        ),
                                                        boxShadow: const <BoxShadow>[
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          right: 25,
                                                          bottom: 25),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image:
                                                                      NetworkImage(
                                                                    "${e['thumbnail']}",
                                                                  ),
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .vertical(
                                                                  top: Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Container(
                                                                height: 30,
                                                                width: 60,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            15),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  "${e['discount']} %",
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "${e['name']}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${e['treading']}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .orangeAccent,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "Rs.${e['price']}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          22,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          }).toList(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container();
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
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
// Container(
//                 height: 320,
//                 width: 180,
//                 color: Colors.red,
//                 child: Column(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Container(),
//                     ),
//                     Expanded(
//                       child: Container(
//                         alignment: Alignment.center,
//                         color: Colors.blue,
//                         child: const Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               "Dusk",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "Treanding",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.orangeAccent,
//                               ),
//                             ),
//                             Text(
//                               "Rs.999",
//                               style: TextStyle(
//                                 fontSize: 22,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
