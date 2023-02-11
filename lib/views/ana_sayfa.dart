import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_bloc_pattern/cubits/ana_sayfa_cubit.dart';
import 'package:kisiler_bloc_pattern/views/kisiler_guncelle_sayfa.dart';
import 'package:kisiler_bloc_pattern/views/kisiler_kayit_sayfa.dart';

import '../models/kisiler.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    // TODO: Cubit sinifini init metodunda tanidirix ve tum kisileri getir metodunu cagiririx!
    super.initState();
    context.read<AnaSayfaCubit>().tumKisileriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                decoration: const InputDecoration(
                  hintText: "Ara",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                onChanged: (aramaSonucu) {
                  context.read<AnaSayfaCubit>().kisileriAra(aramaSonucu);
                },
              )
            : const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                      context.read<AnaSayfaCubit>().tumKisileriGetir();
                    });
                  },
                  icon: const Icon(Icons.close),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
        ],
      ),
      body: BlocBuilder<AnaSayfaCubit, List<KisilerSinifi>>(
          builder: (context, kisilerListesi) {
        if (kisilerListesi.isNotEmpty) {
          return ListView.builder(
            itemCount: kisilerListesi.length,
            itemBuilder: (context, index) {
              var kisi = kisilerListesi[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KisilerGuncelemmeSayfa(
                                kisi: kisi,
                              ))).then((value) => {context.read<AnaSayfaCubit>().tumKisileriGetir()});
                },
                child: Card(
                  child: ListTile(
                    title: Text(kisi.kisi_ad),
                    subtitle: Text(kisi.kisi_tel),
                    trailing: IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${kisi.kisi_ad} Silinsmi?"),
                            action: SnackBarAction(
                              label: "Evet",
                              onPressed: () {
                                context.read<AnaSayfaCubit>().kisiSil(
                                    int.parse(kisi.kisi_id.toString()));
                              },
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // kisileri kaydet ana sayfaya git
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => KisilerKayitSayfa())).then((value) => {context.read<AnaSayfaCubit>().tumKisileriGetir()});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
