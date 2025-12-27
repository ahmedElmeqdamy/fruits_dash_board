import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dash_board/core/services/get_it_service.dart';

import 'core/helper_function/on_generate_route.dart';
import 'core/services/bloc_watch.dart';
import 'core/services/supa_base_storage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //setup bloc observer 2-2
  Bloc.observer = BlocWatch();
  await SupabaseStorageServices.initSupabase();
  await SupabaseStorageServices.createBuckets('fruits_images');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'dashBoardView',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
