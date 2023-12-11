import 'package:flutter/material.dart';

mixin CartMixin<T extends StatefulWidget> on State<T> {
  List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> meal, int quantity) {
    int existingIndex = cartItems.indexWhere((item) => item['yemek_id'] == meal['yemek_id']);

    if (existingIndex != -1) {
      // Eğer ürün zaten sepette ekli ise sadece adetini artır
      setState(() {
        cartItems[existingIndex]['adet'] += quantity;
      });
    } else {
      // Eğer ürün sepette yoksa, yeni bir öğe olarak ekle
      setState(() {
        Map<String, dynamic> newMeal = Map.from(meal);
        newMeal['adet'] = quantity;
        cartItems.add(newMeal);
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${meal['yemek_adi']} sepete eklendi.'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}


