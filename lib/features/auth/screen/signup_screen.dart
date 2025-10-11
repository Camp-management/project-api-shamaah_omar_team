// ignore_for_file: use_build_context_synchronously

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_notes/common/custom_widegt/auth_text_field.dart';
import 'package:smart_notes/features/auth/screen/login_screen.dart';
import 'package:smart_notes/model/auth_input/auth_input.dart';
import 'package:smart_notes/network/network_api.dart';
import 'package:smart_notes/features/auth/screen/login_screen.dart';

import '../../folder/screen/folder_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final api = NetworkApi();

  final TextEditingController controllerUserName = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  bool _loading = false;


  Future<void> _handleSignup() async {
    if (_loading) return;
    setState(() => _loading = true);

    final creds = AuthInput(
      email: controllerUserName.text,
      password: controllerPassword.text,
    );

    try {
      await api.authMethod.signupAccount(authData: creds);
      final loginRes = await api.authMethod.loginAccount(authData: creds);
      final token = loginRes.access_token;

      await GetStorage().write('token', token);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor:  Color.fromARGB(255, 72, 172, 255),
            content: Text('Account created & signed in',
            style: TextStyle(fontSize: 20),)),
      );

      // 3) Go straight into app
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const FolderScreen()),
      );
    } on MapperException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(
          backgroundColor: const Color(0xFFFE4A49),
          content: Text('Parsing failed: $e',
            style: TextStyle(fontSize: 20),)));
    } on FormatException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(
          backgroundColor: const Color(0xFFFE4A49),
          content: Text(e.message,
            style: TextStyle(fontSize: 20),)));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar( backgroundColor: const Color(0xFFFE4A49),
          content: Text(e.toString(),
            style: TextStyle(fontSize: 20),)));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Smart Notes",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              AuthTextField(
                name: "email",
                isEmail: true,
                controller: controllerUserName,
              ),

              const SizedBox(height: 16),

              AuthTextField(
                controller: controllerPassword,
                name: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 72, 172, 255),
                  foregroundColor:Colors.white,
                  fixedSize: Size(350, 50),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: _loading ? null : _handleSignup,
                child: Text(_loading ? 'Please wait…' : 'Signup'),
              ),
              const SizedBox(height: 10),

              Text("You already have an account?"),
              TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 72, 172, 255),),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: Text('Sign in',style: TextStyle(fontSize: 15),)
              ),
            ],
          ),
        ),
      ),
    );
  }

}
