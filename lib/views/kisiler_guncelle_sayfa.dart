import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubits/kisi_guncelle_cubit.dart';
import '../models/kisiler.dart';

class KisilerGuncelemmeSayfa extends StatefulWidget {

  KisilerSinifi kisi;

  KisilerGuncelemmeSayfa({required this.kisi});

  @override
  State<KisilerGuncelemmeSayfa> createState() => _KisilerGuncelemmeSayfaState();
}

class _KisilerGuncelemmeSayfaState extends State<KisilerGuncelemmeSayfa> {

  var tfName = TextEditingController();
  var tfPohneNumber = TextEditingController();

  // direk ersiemedik

  @override
  void initState() {
    super.initState();
    tfName.text = widget.kisi.kisi_ad;
    tfPohneNumber.text = widget.kisi.kisi_tel;

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kişiler Kayıt Sayfası"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),

                    ),
                    hintText: "Kişi Adı",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfPohneNumber,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),

                    ),
                    hintText: "Kişi Telefon",
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<KisiGuncelleCubit>().guncelle(
                        int.parse(widget.kisi.kisi_id),
                        tfName.text,
                        tfPohneNumber.text
                    );

                  },
                  child: const Text("Güncelle")
              )
            ],
          ),
        )
    );
  }
}
