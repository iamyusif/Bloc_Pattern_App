import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_bloc_pattern/repo/ksilerdao_repo.dart';

class KisiKaytCubit extends Cubit<void> {
  KisiKaytCubit() : super(0);

  var ksdRepo = KisilerDaoRepository();

  Future<void> kayit(String kisi_ad, String kisi_tel) async {
    await ksdRepo.kisiKayt(kisi_ad, kisi_tel);
  }
}
