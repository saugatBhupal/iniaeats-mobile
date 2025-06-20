import 'package:flutter/material.dart';
import 'package:inaeats/src/features/customer_service/presentation/widgets/appbar/customer_service_appbar.dart';
import 'package:inaeats/src/features/customer_service/presentation/widgets/messages/message_text_field.dart';
import 'package:inaeats/src/features/customer_service/presentation/widgets/messages/received_tile.dart';
import 'package:inaeats/src/features/customer_service/presentation/widgets/messages/sent_tile.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({super.key});

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  late final TextEditingController _textController;
  final List<Map<String, String>> _messages = [
    {
      'type': 'received',
      'text': "Hello, this is customer service......",
      'time': "an hour ago",
    },
    {
      'type': 'sent',
      'text': "Hello, I am your patient, I am very sick call....",
      'time': "just now",
    },
  ];

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerServiceAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                if (msg['type'] == 'sent') {
                  return SentTile(message: msg['text']!, sent: msg['time']!);
                } else {
                  return ReceivedTile(
                    message: msg['text']!,
                    sent: msg['time']!,
                  );
                }
              },
            ),
          ),
          MessageTextField(controller: _textController, onSend: (text) {}),
        ],
      ),
    );
  }
}
