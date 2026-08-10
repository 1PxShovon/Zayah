import 'package:flutter/material.dart';

class SelectDateTimePage extends StatefulWidget {
  const SelectDateTimePage({super.key});

  @override
 State<SelectDateTimePage> createState() =>
      _SelectDateTimePageState();
}

class _SelectDateTimePageState
    extends State<SelectDateTimePage> {

  DateTime selectedDate = DateTime.now();

  String? selectedSlot;

  final List<String> timeSlots = [
    "08:00 AM - 09:00 AM",
    "09:00 AM - 10:00 AM",
    "10:00 AM - 11:00 AM",
    "11:00 AM - 12:00 PM",
    "01:00 PM - 02:00 PM",
    "02:00 PM - 03:00 PM",
    "03:00 PM - 04:00 PM",
    "04:00 PM - 05:00 PM",
    "05:00 PM - 06:00 PM",
    "06:00 PM - 07:00 PM",
  ];

  Future<void> pickDate() async {

    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 90),
      ),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Select Date & Time",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              "Booking Date",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.calendar_month,
                ),
                title: Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                ),
                trailing: const Icon(
                  Icons.arrow_drop_down,
                ),
                onTap: pickDate,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Available Time Slots",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(

                itemCount: timeSlots.length,

                itemBuilder: (_, index) {

                  final slot = timeSlots[index];

                  return Card(
                    child: RadioListTile<String>(

                      value: slot,

                      groupValue: selectedSlot,

                      title: Text(slot),

                      onChanged: (value) {

                        setState(() {
                          selectedSlot = value;
                        });

                      },
                    ),
                  );
                },
              ),
            ),

            SizedBox(

              width: double.infinity,

              child: FilledButton(

                onPressed: selectedSlot == null
                    ? null
                    : () {

                        Navigator.pushNamed(
                          context,
                          "/booking-summary",
                        );

                      },

                child: const Text(
                  "Continue",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}