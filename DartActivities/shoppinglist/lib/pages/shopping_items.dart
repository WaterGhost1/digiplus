import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglist/data/items_model.dart';
import 'package:shoppinglist/pages/shopping_cart.dart';
import 'package:shoppinglist/pages/shopping_item_tile.dart';

class ShoppingItems extends StatefulWidget {
  const ShoppingItems({super.key});

  @override
  State<ShoppingItems> createState() => _ShoppingItemsState();
}

class _ShoppingItemsState extends State<ShoppingItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Frosted & Fabulous',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff392a48),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Consumer<ItemsModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      itemCount: value.shopItems.length,
                      padding: EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                          ),
                      itemBuilder: (context, index) {
                        return ShoppingItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          containerColor: value.shopItems[index][3],
                          onPressed: () {
                            Provider.of<ItemsModel>(
                              context,
                              listen: false,
                            ).addItemtoCart(index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ShoppingCart();
                  },
                ),
              ),
          backgroundColor: Color(0xff392a48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(Icons.shopping_bag, color: Colors.white),
        ),
      ),
    );
  }
}
