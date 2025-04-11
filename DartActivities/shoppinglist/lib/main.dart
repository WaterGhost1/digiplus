import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglist/data/items_model.dart';
import 'package:shoppinglist/pages/shopping_items.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemsModel(),
      child: MaterialApp(
        theme: ThemeData(
          colorSchemeSeed: Color(0xffF6EEB4),
          // textTheme: GoogleFonts.montserratTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: ShoppingItems(),
      ),
    );
  }
}
