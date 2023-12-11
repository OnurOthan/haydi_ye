import 'package:haydi_ye/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:haydi_ye/pages/cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> exampleMeals = [
      {
        'yemek_id': '1',
        'yemek_adi': 'Ayran',
        'yemek_resim_adi': 'ayran.png',
        'yemek_fiyat': '3',
        'malzemeler': [
          {'miktar': '0.100 gr', 'ad': 'Yogurt'},
          {'miktar': '0.300 gr', 'ad': 'Su'},
          {'miktar': '0.005 gr', 'ad': 'Tuz'},
        ],
      },
      {
        'yemek_id': '2',
        'yemek_adi': 'Baklava',
        'yemek_resim_adi': 'baklava.png',
        'yemek_fiyat': '25',
        'malzemeler': [
          {'miktar': '100 gr', 'ad': 'Yufka'},
          {'miktar': '50 gr',  'ad': 'Ceviz'},
          {'miktar': '75 gr',  'ad': 'Seker'},
        ],
      },
      {
        'yemek_id': '3',
        'yemek_adi': 'Fanta',
        'yemek_resim_adi': 'fanta.png',
        'yemek_fiyat': '6',
        'malzemeler': [
          {'miktar': '100 gr',  'ad': 'Portakal Ekstresi'},
          {'miktar': '100 gr',  'ad': 'Şeker'},
          {'miktar': '50 gr',   'ad': 'Su'},
        ],
      },
      {
        'yemek_id': '4',
        'yemek_adi': 'Izgara Somon',
        'yemek_resim_adi': 'izgarasomon.png',
        'yemek_fiyat': '55',
        'malzemeler': [
          {'miktar': '300 gr', 'ad': 'Norevec Somon'},
          {'miktar': '100 gr', 'ad': 'Patates'},
          {'miktar': '100 gr', 'ad': 'Yag'},
        ],
      },
      {
        'yemek_id': '5',
        'yemek_adi': 'Izgara Tavuk',
        'yemek_resim_adi': 'izgaratavuk.png',
        'yemek_fiyat': '27',
        'malzemeler': [
          {'miktar': '350 gr',  'ad': 'Tavuk But'},
          {'miktar': '100 gr',  'ad': 'Patates'},
          {'miktar': '75 gr',   'ad': 'Biber'},
        ],
      },
      {
        'yemek_id': '6',
        'yemek_adi': 'Kadayıf',
        'yemek_resim_adi': 'kadayif.png',
        'yemek_fiyat': '22',
        'malzemeler': [
          {'miktar': '250 gr',  'ad': 'Tel Yufka'},
          {'miktar': '150vgr',  'ad': 'Ceviz'},
          {'miktar': '75 gr',   'ad': 'Şeker'},
        ],
      },
      {
        'yemek_id': '7',
        'yemek_adi': 'Kahve',
        'yemek_resim_adi': 'kahve.png',
        'yemek_fiyat': '16',
        'malzemeler': [
          {'miktar': '150 gr',  'ad': 'Jameican Coffe'},
          {'miktar': '50 gr',   'ad': 'Belçika Kreması'},
          {'miktar': '300 gr',  'ad': 'Ph7 Su'},
        ],
      },
      {
        'yemek_id': '8',
        'yemek_adi': 'Köfte',
        'yemek_resim_adi': 'kofte.png',
        'yemek_fiyat': '25',
        'malzemeler': [
          {'miktar': '250 gr',   'ad': 'Dana Köfte'},
          {'miktar': '100 gr',   'ad': 'Patates'},
          {'miktar': '75 gr',    'ad': 'Biber'},
        ],
      },
      {
        'yemek_id': '9',
        'yemek_adi': 'Lazanya',
        'yemek_resim_adi': 'lazanya.png',
        'yemek_fiyat': '32',
        'malzemeler': [
          {'miktar': '300 gr', 'ad':   'Lazanya Hamuru'},
          {'miktar': '150 gr',  'ad':  'Ispanak'},
          {'miktar': '100 gr',  'ad':  'Kıyma'},
        ],
      },
      {
        'yemek_id': '10',
        'yemek_adi': 'Makarna',
        'yemek_resim_adi': 'makarna.png',
        'yemek_fiyat': '28',
        'malzemeler': [
          {'miktar': '100 gr', 'ad': 'Taze Makarna'},
          {'miktar': '50 gr',  'ad': 'Terayağ'},
          {'miktar': '75 gr',  'ad': 'Permasan'},
        ],
      },
      {
        'yemek_id': '11',
        'yemek_adi': 'Pizza',
        'yemek_resim_adi': 'pizza.png',
        'yemek_fiyat': '45',
        'malzemeler': [
          {'miktar': '400 gr',  'ad': 'Piza Hamuru'},
          {'miktar': '100 gr',  'ad': 'Mozeralla Peyniri'},
          {'miktar': '75 gr',   'ad': 'Pizza Sosu'},
        ],
      },
      {
        'yemek_id': '12',
        'yemek_adi': 'Su',
        'yemek_resim_adi': 'su.png',
        'yemek_fiyat': '2',
      },
      {
        'yemek_id': '13',
        'yemek_adi': 'Sütlaç',
        'yemek_resim_adi': 'sutlac.png',
        'yemek_fiyat': '10',
        'malzemeler': [
          {'miktar': '300 gr', 'ad': 'Süt'},
          {'miktar': '100 gr', 'ad': 'Şeker'},
          {'miktar': '75 gr',  'ad': 'Prinç'},
        ],
      },
      {
        'yemek_id': '14',
        'yemek_adi': 'Tiramisu',
        'yemek_resim_adi': 'tiramisu.png',
        'yemek_fiyat': '23',
        'malzemeler': [
          {'miktar': '300 gr', 'ad': 'Labne'},
          {'miktar': '50 gr', 'ad':  'Krema'},
          {'miktar': '75 gr', 'ad':  'Kakao'},
        ],
      },
    ];

    return MaterialApp(
      title: 'Haydi Ye',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        hintColor: Colors.orange,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
        ),
      ),
      home: HomePage(meals: exampleMeals),
      routes: {
        '/cart': (context) => CartPage(cartItems: []),
      },
      debugShowCheckedModeBanner: false,

    );
  }
}
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> meal;
  final Function(Map<String, dynamic> meal) addToCart;

  const ProductCard({required this.meal, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(8.0),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
              ),
              child: Image.asset(
                'assets/images/${meal['yemek_resim_adi']}',
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(height: 8),
            Text(
              meal['yemek_adi'],
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Fiyat: ${meal['yemek_fiyat']} ₺',
              style: TextStyle(fontSize: 12),
            ),

             IconButton(
                iconSize: 10,
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  addToCart(meal);
                },
              ),
          ],
        ),
      ),
    );
  }
}
