import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _removeItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
            (context, animation) => buildItem(context, index, animation),
      );
    });
  }

  Widget buildItem(BuildContext context, int index, Animation<double> animation) {
    var cartItem = widget.cartItems[index];
    var count = cartItem['adet'];
    var totalPrice = count * double.parse(cartItem['yemek_fiyat'].toString());

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          _removeItem(index);
        },
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(10),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/${cartItem['yemek_resim_adi']}',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                cartItem['yemek_adi'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (count > 1) {
                            setState(() {
                              cartItem['adet'] -= 1;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.remove, size: 10, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text('$count', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            cartItem['adet'] += 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.add, size: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              trailing: Text(
                'Fiyat:${NumberFormat.currency(locale: 'tr_TR', symbol: '₺').format(totalPrice)}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateTotalPrice() {
    double total = 0;
    for (var cartItem in widget.cartItems) {
      var count = cartItem['adet'];
      var price = double.parse(cartItem['yemek_fiyat'].toString());
      total += count * price;
    }
    return total;
  }

  void _clearCart() {
    setState(() {
      widget.cartItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart, color: Colors.white),
            SizedBox(width: 8.0),
            Text(
              'SEPETİM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
        elevation: 18,
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.popUntil(context,ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      body: widget.cartItems.isEmpty
          ? Center(
        child: Text('Sepetiniz boş.'),
      )
          : AnimatedList(
        key: _listKey,
        initialItemCount: widget.cartItems.length,
        itemBuilder: (context, index, animation) {
          return buildItem(context, index, animation);
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Toplam Fiyat: ${NumberFormat.currency(locale: 'tr_TR', symbol: '₺').format(_calculateTotalPrice())}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _clearCart();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.clear),
                      SizedBox(width: 8),
                      Text('Sepeti Temizle'),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Sepeti Onayla işlevi
                  },
                  child: Row(
                    children: [
                      Icon(Icons.check),
                      SizedBox(width: 8),
                      Text('Sepeti Onayla'),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}