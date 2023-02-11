import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ksilerdao_repo.dart';


class KisiGuncelleCubit extends Cubit<void> {
  KisiGuncelleCubit() : super(0);

  var kguncelRepo = KisilerDaoRepository();

  Future<void> guncelle(int kisi_id,String kisi_ad, String kisi_tel) async {
    await kguncelRepo.kisiGuncelle(kisi_id,kisi_ad, kisi_tel);
  }
}
