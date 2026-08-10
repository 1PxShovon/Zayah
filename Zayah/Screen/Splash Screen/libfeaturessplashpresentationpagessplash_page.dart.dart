import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/presentation/controllers/auth_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    context.read<AuthController>().checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthController, AuthState>(
      listener: (context, state) {

        if (state is AuthAuthenticated) {
          Navigator.pushReplacementNamed(
            context,
            "/home",
          );
        }

        if (state is AuthUnauthenticated) {
          Navigator.pushReplacementNamed(
            context,
            "/login",
          );
        }

      },
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              FlutterLogo(size: 100),

              SizedBox(height: 20),

              Text(
                "Zayah",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30),

              CircularProgressIndicator(),

            ],
          ),
        ),
      ),
    );
  }
}