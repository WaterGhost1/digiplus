import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglist/data/items_model.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('My Cart', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xff392a48),
        ),
        body: Consumer<ItemsModel>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(value.cartItems[index][0]),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            value.removeItemtoCart(index);
                          },
                          background: Container(
                            color: Colors.redAccent,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: value.cartItems[index][3],
                            ),
                            child: Stack(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                    value.cartItems[index][2],
                                    height: 90,
                                  ),
                                  title: Text(
                                    value.cartItems[index][0],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff301934),
                                    ),
                                  ),
                                  subtitle: Text(
                                    '\$' + value.cartItems[index][1],
                                  ),
                                  // trailing: Row(
                                  //   mainAxisSize: MainAxisSize.min,
                                  //   children: [
                                  //     // QuantitySelector(),
                                  //     IconButton(
                                  //       onPressed: () {
                                  //         value.removeItemtoCart(index);
                                  //       },
                                  //       icon: Icon(Icons.close),
                                  //     ),
                                  //   ],
                                  // ),
                                ),

                                Positioned(
                                  top: 12,
                                  right: 1,
                                  child: QuantitySelector(
                                    item: value.cartItems[index],
                                    index: index,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff392a48), //Color(0xffd8bfd8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Total Price: ",
                            style: TextStyle(color: Colors.white54),
                          ),
                          Text(
                            '\$' + value.calculateTotal(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  final List<dynamic> item;
  final int index;
  const QuantitySelector({required this.item, required this.index, super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  void initState() {
    super.initState();
    _quantity = widget.item[4]; // Initialize with the item's current quantity
  }

  void _increment() {
    setState(() {
      _quantity++;
      widget.item[4] = _quantity; // Update the item quantity
      Provider.of<ItemsModel>(
        context,
        listen: false,
      ).updateItemQuantity(widget.index, _quantity);
    });
  }

  void _decrement() {
    setState(() {
      if (_quantity > 0) _quantity--;
      widget.item[4] = _quantity; // Update the item quantity
      Provider.of<ItemsModel>(
        context,
        listen: false,
      ).updateItemQuantity(widget.index, _quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final cartItems = Provider.of<ItemsModel>(context).cartItems;

    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              if (_quantity > 1) {
                _decrement();
              }
            },
            icon: Icon(Icons.remove, color: Color(0xff301934), size: 10),
          ),
          Text(
            '$_quantity',
            style: TextStyle(fontSize: 14, color: Color(0xff301934)),
          ),
          IconButton(
            onPressed: () {
              _increment();
            },
            icon: Icon(Icons.add, color: Color(0xff301934), size: 10),
          ),
        ],
      ),
    );
  }
}
