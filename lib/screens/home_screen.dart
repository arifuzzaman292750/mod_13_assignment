import 'package:batch_seven_assignments/components/shirt_tile.dart';
import 'package:batch_seven_assignments/constants.dart';
import 'package:batch_seven_assignments/models/shirt.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Shirt> shirtItemList = [
    Shirt(
      name: 'PullOver',
      color: 'Black',
      size: 'L',
      price: 51.0,
      imagePath: 'lib/images/pullover.png',
    ),

    Shirt(
      name: 'T-Shirt',
      color: 'Gray',
      size: 'L',
      price: 30.0,
      imagePath: 'lib/images/sport.png',
    ),

    Shirt(
      name: 'Sport Dress',
      color: 'Black',
      size: 'M',
      price: 43.0,
      imagePath: 'lib/images/t-shirt.png',
    ),
  ];

  List<Shirt> get shirtList => shirtItemList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: myAppBar,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemCount: shirtItemList.length,
                itemBuilder: (context, index) {
                  return ShirtTile(
                    shirt: shirtItemList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total amount:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  '${getTotalAmount().toString()}\$',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                fixedSize: const Size.fromWidth(double.maxFinite),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Have a great day!'),
                  ),
                );
              },
              child: Text(
                'CHECK OUT',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[200],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  int getTotalAmount() {
    return shirtItemList.fold(
        0, (sum, item) => sum + item.price.toInt());
  }
}