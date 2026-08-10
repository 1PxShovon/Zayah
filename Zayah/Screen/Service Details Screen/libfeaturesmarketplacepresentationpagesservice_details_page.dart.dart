import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({
    super.key,
    required this.serviceId,
  });

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    // TODO:
    // ServiceCubit/GetServiceByIdUseCase দিয়ে service load হবে

    return Scaffold(
      appBar: AppBar(
        title: const Text("Service Details"),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SizedBox(
          height: 52,
          child: FilledButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/booking",
                arguments: serviceId,
              );
            },
            child: const Text("Book Now"),
          ),
        ),
      ),
      body: ListView(
        children: [

          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.grey.shade300,
              child: const Icon(
                Icons.image,
                size: 80,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                const Text(
                  "AC Repair Service",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: const [

                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),

                    SizedBox(width: 4),

                    Text("4.8"),

                    SizedBox(width: 8),

                    Text("(245 Reviews)"),

                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  "Price",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "10 KWD",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Professional AC repair service with experienced technicians across Kuwait.",
                ),

                const SizedBox(height: 24),

                const Divider(),

                const ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.business),
                  ),
                  title: Text("CoolFix Kuwait"),
                  subtitle: Text("Verified Provider"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}