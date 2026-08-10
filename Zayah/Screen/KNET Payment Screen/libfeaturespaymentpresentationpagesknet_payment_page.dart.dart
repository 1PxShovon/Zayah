import 'package:flutter/material.dart';

class KnetPaymentPage extends StatefulWidget {
  const KnetPaymentPage({super.key});

  @override
  State<KnetPaymentPage> createState() =>
      _KnetPaymentPageState();
}

class _KnetPaymentPageState
    extends State<KnetPaymentPage> {

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _startPayment();
  }

  Future<void> _startPayment() async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  void _paymentSuccess() {

    Navigator.pushReplacementNamed(
      context,
      "/order-confirmation",
    );

  }

  void _paymentFailed() {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Payment Failed",
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "KNET Payment",
        ),
      ),

      body: isLoading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  const EdgeInsets.all(20),
              child: Column(

                children: [

                  const Icon(
                    Icons.lock,
                    size: 70,
                    color: Colors.green,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Secure KNET Payment",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "You will be redirected to the secure KNET payment gateway.",
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed:
                          _paymentSuccess,
                      child: const Text(
                        "Simulate Success",
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed:
                          _paymentFailed,
                      child: const Text(
                        "Simulate Failure",
                      ),
                    ),
                  ),

                ],
              ),
            ),
    );
  }
}