
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Map<String, dynamic>>> getMealList() async {
    final response = await http.get(
      Uri.parse('http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php'),
    );

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> meals = [];
      List<dynamic> data = json.decode(response.body)['yemekler'];

      for (var item in data) {
        meals.add({
          'yemek_id': item['yemek_id'],
          'yemek_adi': item['yemek_adi'],
          'yemek_resim_adi': item['yemek_resim_adi'],
          'yemek_fiyat': item['yemek_fiyat'],
        });
      }

      return meals;
    } else {
      throw Exception('Yemekleri getirirken hata oluştu. HTTP Hata Kodu: ${response.statusCode}');
    }
  }
}

