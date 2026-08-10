import 'package:flutter/material.dart';

class BookingSummaryPage extends StatelessWidget {
  const BookingSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double servicePrice = 10.000;
    const double vat = 0.500;
    const double discount = 0.000;

    final double total =
        servicePrice + vat - discount;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Summary"),
      ),

      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: FilledButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              "/checkout",
            );
          },
          child: const Text(
            "Continue to Checkout",
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            "Service",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Card(
            child: ListTile(
              leading: Icon(
                Icons.home_repair_service,
              ),
              title: Text(
                "AC Repair Service",
              ),
              subtitle: Text(
                "Professional AC Technician",
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Provider",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.business),
              ),
              title: Text("CoolFix Kuwait"),
              subtitle: Text("Verified Provider"),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Booking Details",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Card(
            child: Column(
              children: [

                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text("Home"),
                  subtitle: Text(
                    "Salmiya, Kuwait",
                  ),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Text("15 Aug 2026"),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text(
                    "10:00 AM - 11:00 AM",
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Payment Summary",
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

                  _priceRow(
                    "Service",
                    "$servicePrice KWD",
                  ),

                  _priceRow(
                    "VAT",
                    "$vat KWD",
                  ),

                  _priceRow(
                    "Discount",
                    "-$discount KWD",
                  ),

                  const Divider(),

                  _priceRow(
                    "Total",
                    "$total KWD",
                    bold: true,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          CheckboxListTile(
            value: true,
            onChanged: (_) {},
            title: const Text(
              "I agree to Terms & Conditions",
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  static Widget _priceRow(
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