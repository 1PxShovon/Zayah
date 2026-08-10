import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  final String orderId;

  const OrderDetailsPage({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: FilledButton.icon(
          onPressed: () {
            Navigator.pushNamed(
              context,
              "/booking-tracking",
              arguments: orderId,
            );
          },
          icon: const Icon(Icons.location_on),
          label: const Text("Track Technician"),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Card(
            child: ListTile(
              leading: const Icon(Icons.confirmation_number),
              title: Text("Order #$orderId"),
              subtitle: const Text("Confirmed"),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Service",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.home_repair_service),
              title: Text("AC Repair"),
              subtitle: Text("Professional Home Service"),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Provider",
            style: TextStyle(
              fontSize: 18,
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
            "Technician",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text("Ahmed Ali"),
              subtitle: Text("Senior Technician"),
              trailing: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Booking Address",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Home"),
              subtitle: Text("Salmiya, Kuwait"),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Payment",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.payments),
              title: Text("KNET"),
              subtitle: Text("Paid Successfully"),
              trailing: Text("10.500 KWD"),
            ),
          ),

          const SizedBox(height: 20),

          OutlinedButton.icon(
            onPressed: () {
              // TODO: Cancel Order
            },
            icon: const Icon(Icons.cancel),
            label: const Text("Cancel Order"),
          ),

        ],
      ),
    );
  }
}