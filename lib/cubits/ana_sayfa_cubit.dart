import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_bloc_pattern/models/kisiler.dart';

import '../repo/ksilerdao_repo.dart';

class AnaSayfaCubit extends Cubit<List<KisilerSinifi>> { // kisiler sinifi modelden
  // gelen kisiler sinifi listesi
  AnaSayfaCubit() : super(<KisilerSinifi>[]);

  var listRepoKisiler = KisilerDaoRepository();

  Future<void> tumKisileriGetir() async {
    var kisilerListesi = await listRepoKisiler.tumKisileriAl();
    emit(kisilerListesi);
  }

// kisi arama
  Future<void> kisileriAra(String aranaKelime) async {
    var kisilerListesi = await listRepoKisiler.kisileriAra(aranaKelime);
    emit(kisilerListesi);
  }

  // kisi silme

  Future<void> kisiSil(int kisi_id) async {
    await listRepoKisiler.kisiSil(kisi_id);
    await tumKisileriGetir();
  }





}