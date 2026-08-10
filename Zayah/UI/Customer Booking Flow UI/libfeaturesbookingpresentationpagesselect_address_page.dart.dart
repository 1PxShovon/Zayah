import 'package:flutter/material.dart';

class SelectAddressPage extends StatelessWidget {
  const SelectAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Address"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Add New Address
        },
        icon: const Icon(Icons.add_location_alt),
        label: const Text("Add Address"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Card(
            child: RadioListTile(
              value: 0,
              groupValue: 0,
              onChanged: (_) {},
              title: const Text("Home"),
              subtitle: const Text(
                "Salmiya, Block 10, Street 5, Kuwait",
              ),
            ),
          ),

          Card(
            child: RadioListTile(
              value: 1,
              groupValue: 0,
              onChanged: (_) {},
              title: const Text("Office"),
              subtitle: const Text(
                "Kuwait City, Sharq",
              ),
            ),
          ),

          const SizedBox(height: 30),

          FilledButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/select-date-time",
              );
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}