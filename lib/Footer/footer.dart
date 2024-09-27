import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'OVERVIEW',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Text('About us'),
                        Text('FAQs'),
                        Text('Privacy Policy'),
                        Text('Terms & Conditions'),
                        Text('Corporate Policies'),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'OTHERS',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Text('Advertise with Us'),
                        Text('Careers'),
                        Text('Customer Care'),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'CONNECT WITH US',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Text('0000 000 0000 (Toll-Free)'),
                        Text('support@carzone.com'),
                        Text('Dealer solutions'),
                        Text('Used Cars Business'),
                        Text('Contact Us'),
                        Text('Feedback'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
