/*
Auth Gate - This is a continuous listen for auth state changes.
 if we are unauthenticated -> it'll show login page
 if we are authenticated -> show Profile Page
*/

import 'package:flutter/material.dart';
import 'package:my_auth_tuto/pages/profile_page.dart';
import 'package:my_auth_tuto/pages/Login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,

      builder: (context, snapshot) {
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        //check if there is a valid session currently
        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          return const ProfilePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}