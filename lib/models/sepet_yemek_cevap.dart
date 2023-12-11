// models/sepet_yemek_cevap.dart
class SepetYemekCevap {
  List<SepetYemek> sepetYemekListesi;

  SepetYemekCevap({required this.sepetYemekListesi});

  factory SepetYemekCevap.fromJson(List<dynamic> json) {
    List<SepetYemek> sepetYemekler = List<SepetYemek>.from(json.map((item) => SepetYemek.fromJson(item)));
    return SepetYemekCevap(sepetYemekListesi: sepetYemekler);
  }
}

class SepetYemek {
  int id;
  String yemekAdi;
  double yemekFiyat;
  String yemekResimAdi;

  SepetYemek({
    required this.id,
    required this.yemekAdi,
    required this.yemekFiyat,
    required this.yemekResimAdi,
  });

  factory SepetYemek.fromJson(Map<String, dynamic> json) {
    return SepetYemek(
      id: json['id'],
      yemekAdi: json['yemek_adi'],
      yemekFiyat: json['yemek_fiyat'].toDouble(),
      yemekResimAdi: json['yemek_resim_adi'],
    );
  }
}
