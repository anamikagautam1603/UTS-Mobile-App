import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 36, 99, 147),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ExpansionTile(
              title: Text('How do I book an unreserved ticket?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'To book an unreserved ticket, follow these steps:\n\n1. Tap the "Booking" option in the menu.\n2. Select your departure and arrival stations.\n3. Choose the date and time of your travel.\n4. Review the available ticket options and select the one that suits your needs.\n5. Proceed to payment and complete the booking.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('How can I contact customer support?'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'You can contact our customer support team in the following ways:\n\n- Email: support@utstickets.com\n- Phone: 1-800-123-4567\n- Live chat: Available on our website during business hours.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
