import 'package:flutter/material.dart';
import 'package:haydi_ye/pages/detail_page.dart';
import 'package:haydi_ye/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, dynamic>> meals;

  HomePage({required this.meals});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '            HAYDİ YEEEE',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: widget.meals.length,
        itemBuilder: (context, index) {
          var meal = widget.meals[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    meal: meal,
                    cartItems: cartItems,
                    onAddToCart: addToCart,
                  ),
                ),
              );
            },
            child: ProductCard(
              meal: meal,
              addToCart: () => addToCart(meal, 1),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Ana Sayfa ile ilgili bir işlevi burada çağırabilirsiniz
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  // Favoriler ile ilgili bir işlevi burada çağırabilirsiniz
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Profil ile ilgili bir işlevi burada çağırabilirsiniz
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addToCart(Map<String, dynamic> meal, int quantity) {
    int existingIndex =
    cartItems.indexWhere((item) => item['yemek_id'] == meal['yemek_id']);

    if (existingIndex != -1) {
      setState(() {
        cartItems[existingIndex]['adet'] += quantity;
      });
    } else {
      setState(() {
        Map<String, dynamic> newMeal = Map.from(meal);
        newMeal['adet'] = quantity;
        cartItems.add(newMeal);
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${meal['yemek_adi']} Sepete Eklendi.'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> meal;
  final Function() addToCart;

  const ProductCard({required this.meal, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(

              child: Image.asset(
                'assets/images/${meal['yemek_resim_adi']}',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 4),
            Text(
              meal['yemek_adi'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Fiyat: ${meal['yemek_fiyat']} ₺',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                onPressed: addToCart,
                child: Text('Sepete Ekle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
