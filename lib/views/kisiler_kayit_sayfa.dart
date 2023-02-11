import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_bloc_pattern/cubits/kisi_kayit_cubit.dart';

class KisilerKayitSayfa extends StatefulWidget {
  const KisilerKayitSayfa({Key? key}) : super(key: key);

  @override
  State<KisilerKayitSayfa> createState() => _KisilerKayitSayfaState();
}

class _KisilerKayitSayfaState extends State<KisilerKayitSayfa> {

  var tfName = TextEditingController();
  var tfPohneNumber = TextEditingController();





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
                context.read<KisiKaytCubit >().kayit(tfName.text.toString(), tfPohneNumber.text.toString());
              },
              child: const Text("Kaydet"),
            ),
          ],
        ),
      )
    );
  }
}
