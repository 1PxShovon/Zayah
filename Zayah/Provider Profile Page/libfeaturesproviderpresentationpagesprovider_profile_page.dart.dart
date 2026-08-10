import 'package:flutter/material.dart';

class ProviderProfilePage extends StatelessWidget {
  final String providerId;

  const ProviderProfilePage({
    super.key,
    required this.providerId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Profile"),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: FilledButton.icon(
          onPressed: () {
            // TODO: Open provider services
          },
          icon: const Icon(Icons.home_repair_service),
          label: const Text("View Services"),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Center(
            child: Column(
              children: [

                const CircleAvatar(
                  radius: 45,
                  child: Icon(
                    Icons.business,
                    size: 40,
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [

                    Text(
                      "CoolFix Kuwait",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 6),

                    Icon(
                      Icons.verified,
                      color: Colors.blue,
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                const Text(
                  "Professional Home Services",
                ),

              ],
            ),
          ),

          const SizedBox(height: 30),

          const ListTile(
            leading: Icon(Icons.star),
            title: Text("Rating"),
            trailing: Text("4.8 / 5"),
          ),

          const ListTile(
            leading: Icon(Icons.reviews),
            title: Text("Reviews"),
            trailing: Text("245"),
          ),

          const ListTile(
            leading: Icon(Icons.work_history),
            title: Text("Experience"),
            trailing: Text("8 Years"),
          ),

          const Divider(),

          const Text(
            "Working Hours",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Card(
            child: ListTile(
              leading: Icon(Icons.schedule),
              title: Text("Saturday - Thursday"),
              subtitle: Text("08:00 AM - 08:00 PM"),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Service Areas",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Wrap(
            spacing: 8,
            children: [

              Chip(label: Text("Kuwait City")),
              Chip(label: Text("Hawally")),
              Chip(label: Text("Salmiya")),
              Chip(label: Text("Farwaniya")),
              Chip(label: Text("Ahmadi")),

            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Portfolio",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_, index) {
                return Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.image,
                    size: 40,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Contact",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [

              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  label: const Text("Call"),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.chat),
                  label: const Text("Chat"),
                ),
              ),

            ],
          ),

          const SizedBox(height: 30),

          const Text(
            "Available Technicians",
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

          const Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text("Mohammed Hassan"),
              subtitle: Text("Electrical Specialist"),
              trailing: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}