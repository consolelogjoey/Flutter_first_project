import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/components/food_tile.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/page/food_details_page.dart';
import 'package:sushi_app/theme/colors.dart';

class Menupage extends StatefulWidget {
  const Menupage({super.key});

  @override
  State<Menupage> createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  List carouselList = [
    {
      "discount": 50,
      "image": "lib/images/salmon.png",
    },
    {
      "discount": 20,
      "image": "lib/images/salmon.png",
    },
  ];

  List sushiList = [
    {
      "name": "salmon",
      "image": "lib/images/salmon.png",
      "price": 5,
      "rating": 5,
      "favourite": true,
      "tags": "rare"
    },
    {
      "name": "salmon",
      "image": "lib/images/salmon.png",
      "price": 5,
      "rating": 5,
      "favourite": true,
      "tags": "medium_rare"
    },
    {
      "name": "salmon",
      "image": "lib/images/salmon.png",
      "price": 5,
      "rating": 5,
      "favourite": true,
      "tags": "medium_rare"
    },
  ];

  List favSushiList = [
    {
      "name": "salmon",
      "image": "lib/images/salmon.png",
      "price": 5,
      "favourite": true,
    },
    {
      "name": "salmon",
      "image": "lib/images/salmon.png",
      "price": 5,
      "favourite": false,
    },
    {
      "name": "salmon",
      "image": "lib/images/salmon.png",
      "price": 5,
      "favourite": false,
    },
  ];

  bool isTapped = false; // Variable to track the tap state

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        backgroundColor: Colors.grey[600],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Order'),
              onTap: () {
                Navigator.pushNamed(context, '/orderpage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.pushNamed(context, '/favorites');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Tokyo',
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: carouselList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTapDown: (_) {
                      setState(() {
                        isTapped = true; // Set to true when tapped
                      });
                    },
                    onTapUp: (_) {
                      setState(() {
                        isTapped = false; // Set to false after tap
                      });
                      Navigator.pushNamed(context, '/redeem');
                    },
                    child: AnimatedScale(
                      scale: isTapped ? 1.05 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: isTapped
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Get ${carouselList[index]["discount"]}% Free",
                                  style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 20, color: Colors.white),
                                ),
                                const SizedBox(height: 20),
                                MyButton(
                                  text: "Redeem",
                                  onTap: () {
                                    Navigator.pushNamed(context, '/redeem');
                                  },
                                )
                              ],
                            ),
                            Image.asset(
                              'lib/images/salmon.png',
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Search menu..."),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Food Menu",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetails(index),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.only(left: 30, right: 25, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "lib/images/koung.png",
                        height: 60,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tempura",
                            style: GoogleFonts.dmSerifDisplay(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$11.00",
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                    size: 28,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
