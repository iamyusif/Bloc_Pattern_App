import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_bloc_pattern/views/ana_sayfa.dart';

import 'cubits/ana_sayfa_cubit.dart';
import 'cubits/kisi_guncelle_cubit.dart';
import 'cubits/kisi_kayit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KisiKaytCubit()),
        BlocProvider(create: (context) => KisiGuncelleCubit()),
        BlocProvider(create: (context) => AnaSayfaCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  AnaSayfa(),
      ),
    );
  }
}

