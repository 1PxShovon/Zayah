import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatelessWidget {
  final String bookingId;

  const OrderConfirmationPage({
    super.key,
    required this.bookingId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Order Confirmed"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              const SizedBox(height: 30),

              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  size: 60,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Booking Confirmed",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Your booking has been placed successfully.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [

                      _row(
                        "Booking ID",
                        bookingId,
                      ),

                      _row(
                        "Payment",
                        "Successful",
                      ),

                      _row(
                        "Status",
                        "Confirmed",
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/my-bookings",
                    );
                  },
                  icon: const Icon(Icons.receipt),
                  label: const Text("Track Booking"),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO:
                    // Download Invoice PDF
                  },
                  icon: const Icon(Icons.download),
                  label: const Text("Download Invoice"),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/home",
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.home),
                  label: const Text("Back to Home"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _row(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        children: [

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Text(value),

        ],
      ),
    );
  }
}