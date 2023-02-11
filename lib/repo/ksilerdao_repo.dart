import '../models/kisiler.dart';
import '../models/kisiler_cavab.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class KisilerDaoRepository {
// burda list verme sebebimiz string oldugu ucundu hamisi yoxsa future metodu ile de gondere bilirik
  List<KisilerSinifi> parseKisilerCavab(String cavab) { // parse islemi
    return KisilerCavab.fromJson(json.decode(cavab)).ikisiler;
  }
// kisi ekleme fonksiyonu post methodu ile
  Future<void> kisiKayt(String kisi_ad, String kisi_tel) async {
    var url = "https://hasanzade.site/web_service/insert_kisiler.php";
    var veri = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
     var cevab = await Dio().post(url, data: FormData.fromMap(veri));
    print(cevab.data.toString());
  }


  // kisi guncelleme fonksiyonu post methodu ile

  Future<void> kisiGuncelle(

    int kisi_id, String kisi_ad, String kisi_tel) async {
    var url = "https://hasanzade.site/web_service/update_kisiler.php";
    var guncelle = {
      "kisi_id": kisi_id,
      "kisi_ad": kisi_ad,
      "kisi_tel": kisi_tel
    };
    var cevab = await Dio().post(url, data: FormData.fromMap(guncelle));
    print(cevab.data.toString());
  }

  // tum kisileri getirme fonksiyonu get methodu ile

  Future<List<KisilerSinifi>> tumKisileriAl() async {
    var url = "https://hasanzade.site/web_service/tum_kisiler.php";
    var cevap = await Dio().get(url);
    return parseKisilerCavab(cevap.data.toString());

  }

  // arama fonksiyonu post methodu ile

  Future<List<KisilerSinifi>> kisileriAra(String arananKelime) async{
    var url = "https://hasanzade.site/web_service/tum_kisiler_arama.php";
    var arama = {"kisi_ad": arananKelime};
    var cevab = await Dio().post(url, data: FormData.fromMap(arama));
    return parseKisilerCavab(cevab.data.toString());
  }

  // kisi silme fonksiyonu post methodu ile

  Future<void> kisiSil(int kisi_id) async {
    var url = "https://hasanzade.site/web_service/delete_kisiler.php";
    var silID = {"kisi_id": kisi_id};
    var cevab = await Dio().post(url, data: FormData.fromMap(silID));
    print(cevab.data.toString());


  }
}
