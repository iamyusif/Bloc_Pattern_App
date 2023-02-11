import 'package:kisiler_bloc_pattern/models/kisiler.dart';

class KisilerCavab {
  List<KisilerSinifi> ikisiler;
  int success;

  KisilerCavab({required this.ikisiler, required this.success});

  factory KisilerCavab.fromJson(Map<String, dynamic> json) {
    var list = json['kisiler'] as List;

    List<KisilerSinifi> kisilerListesi =
        list.map((i) => KisilerSinifi.fromJson(i)).toList();

    return KisilerCavab(
      ikisiler: kisilerListesi,
      success: json['success'],
    );
  }
}
