import 'package:flutter/material.dart';
import '../../entities/game.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<Game> _cartItems = [];
  int _total = 0;

  @override
  void initState() {
    super.initState();

    _cartItems.add(Game("assets/images/dmc5.jpg", "Devil May Cry 5", "", 200, 1));
    _cartItems.add(Game("assets/images/re8.jpg", "Resident Evil Village", "", 200, 1));
    _cartItems.add(Game("assets/images/nfs.jpg", "Need For Speed Heat", "", 100, 1));

    _calculateTotal();
  }

  void _calculateTotal() {
    _total = _cartItems.fold(0, (sum, game) => sum + game.price);
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
      _calculateTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Panier",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Center(
              child: Text(
                "Total : $_total TND",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          final game = _cartItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.black),
                  onPressed: () => _removeItem(index),
                ),
                Image.asset(
                  game.image,
                  width: 120,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                const Spacer(),
                Text(
                  "${game.price} TND",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 15),
              ],
            ),
          );
        },
      ),
    );
  }
}
