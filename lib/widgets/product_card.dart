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
      // ... (Diğer AppBar ve bottomNavigationBar kodları)

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
              addToCart: () => addToCart(meal, 1), // Değişiklik burada
            ),
          );
        },
      ),
      // ... (Diğer bottomNavigationBar ve appBar kodları)
    );
  }

  void addToCart(Map<String, dynamic> meal, int quantity) {
    int existingIndex = cartItems.indexWhere((item) => item['yemek_id'] == meal['yemek_id']);

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
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
            ),
            child: Image.asset(
              'assets/images/${meal['yemek_resim_adi']}',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            meal['yemek_adi'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Fiyat: ${meal['yemek_fiyat']} TL',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: addToCart,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_cart, size: 18),
                  SizedBox(width: 8),
                  Text('Sepete Ekle', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Malzemeler',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                if (meal['malzemeler'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var malzeme in meal['malzemeler'])
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle, size: 16, color: Colors.green),
                              SizedBox(width: 8),
                              Text(
                                '${malzeme['miktar']} ${malzeme['ad']}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
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
}
