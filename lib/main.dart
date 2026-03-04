import 'package:flutter/material.dart';
import 'package:my_auth_tuto/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {

  //supabase setup
  await Supabase.initialize(
    anonKey: "sb_publishable_taamsEhDRVakVt9_Jhi4BA_gvAIMJ0A",
    url: "https://zpbawsmjvsszsepjxupj.supabase.co",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthGate(),
    );
  }
}