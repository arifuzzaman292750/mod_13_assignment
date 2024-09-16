import 'package:batch_seven_assignments/models/shirt.dart';
import 'package:flutter/material.dart';

class ShirtTile extends StatefulWidget {
  final Shirt shirt;

  const ShirtTile({super.key, required this.shirt});

  @override
  State<ShirtTile> createState() => _ShirtTileState();
}

class _ShirtTileState extends State<ShirtTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // image
          Image.asset(
            widget.shirt.imagePath,
            height: 120,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // shirt name & menu icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // shirt name
                    Text(
                      widget.shirt.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // menu icon
                    const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                  ],
                ),

                // color & size
                Row(
                  children: [
                    // color
                    Row(
                      children: [
                        Text(
                          'Color: ',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          widget.shirt.color,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),

                    // size
                    Row(
                      children: [
                        Text(
                          'Size: ',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          widget.shirt.size,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),

                // + - button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.2),
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(-0.0, -0.0),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.2),
                            ],
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.2),
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(-0.0, -0.0),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.2),
                            ],
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${widget.shirt.price.toString()}\$',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int quantityCount = 1;

  int unitPrice = 0;
  

  void decrementQuantity() {
    if (quantityCount > 1) {
      quantityCount--;
    }
    setState(() {});
  }

  void incrementQuantity() {
    quantityCount++;
    setState(() {});
  }


}
