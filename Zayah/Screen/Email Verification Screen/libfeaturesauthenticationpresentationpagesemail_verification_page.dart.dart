import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/auth_controller.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<AuthController, AuthState>(
          listener: (context, state) {
            if (state is EmailVerified) {
              Navigator.pushReplacementNamed(
                context,
                "/home",
              );
            }

            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Icon(
                  Icons.mark_email_read,
                  size: 90,
                ),

                const SizedBox(height: 20),

                const Text(
                  "We've sent a verification email to your inbox.",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<AuthController>()
                          .checkEmailVerification();
                    },
                    child: const Text(
                      "I've Verified My Email",
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                TextButton(
                  onPressed: () {
                    context
                        .read<AuthController>()
                        .resendVerificationEmail();
                  },
                  child: const Text(
                    "Resend Verification Email",
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}