import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedPaymentMethod = "knet";

  final TextEditingController promoController =
      TextEditingController();

  @override
  void dispose() {
    promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const total = 10.500;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),

      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: FilledButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              "/knet-payment",
            );
          },
          child: const Text(
            "Proceed to Payment",
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            "Payment Method",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Card(
            child: RadioListTile<String>(
              value: "knet",
              groupValue: selectedPaymentMethod,
              title: const Text("KNET"),
              subtitle: const Text(
                "Recommended for Kuwait",
              ),
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
          ),

          Card(
            child: RadioListTile<String>(
              value: "wallet",
              groupValue: selectedPaymentMethod,
              title: const Text("Wallet"),
              subtitle: const Text(
                "Coming Soon",
              ),
              onChanged: null,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Promo Code",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: promoController,
            decoration: InputDecoration(
              hintText: "Enter promo code",
              suffixIcon: TextButton(
                onPressed: () {},
                child: const Text("Apply"),
              ),
              border: const OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Invoice Summary",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  _row("Service", "10.000 KWD"),
                  _row("VAT", "0.500 KWD"),
                  _row("Discount", "0.000 KWD"),

                  const Divider(),

                  _row(
                    "Total",
                    "$total KWD",
                    bold: true,
                  ),

                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          const Row(
            children: [

              Icon(
                Icons.lock,
                color: Colors.green,
              ),

              SizedBox(width: 8),

              Expanded(
                child: Text(
                  "Your payment is secured using encrypted communication.",
                ),
              ),

            ],
          ),

          const SizedBox(height: 40),

        ],
      ),
    );
  }

  Widget _row(
    String title,
    String value, {
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        children: [

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: bold
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              fontWeight: bold
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),

        ],
      ),
    );
  }
}