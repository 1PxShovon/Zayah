import 'package:flutter/material.dart';

class BookingTrackingPage extends StatelessWidget {
  final String orderId;

  const BookingTrackingPage({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Booking"),
      ),

      body: Column(
        children: [

          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              color: Colors.grey.shade300,
              child: const Center(
                child: Text(
                  "Google Maps\n(Integration Pending)",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(
                    "Booking Status",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text("Ahmed Ali"),
                    subtitle:
                        Text("Senior Technician"),
                  ),

                  const Divider(),

                  const ListTile(
                    leading:
                        Icon(Icons.schedule),
                    title:
                        Text("Estimated Arrival"),
                    trailing: Text("18 min"),
                  ),

                  const ListTile(
                    leading:
                        Icon(Icons.location_on),
                    title: Text("Current Status"),
                    subtitle:
                        Text("On the way"),
                  ),

                  const Spacer(),

                  Row(
                    children: [

                      Expanded(
                        child:
                            FilledButton.icon(
                          onPressed: () {
                            // TODO:
                            // Call Technician
                          },
                          icon:
                              const Icon(Icons.call),
                          label:
                              const Text("Call"),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child:
                            OutlinedButton.icon(
                          onPressed: () {
                            // TODO:
                            // Open Chat
                          },
                          icon:
                              const Icon(Icons.chat),
                          label:
                              const Text("Chat"),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}