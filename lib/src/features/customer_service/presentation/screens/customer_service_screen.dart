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

  // Make _messages mutable
  final List<Map<String, String>> _messages = [];

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();

    _messages.add({'type': 'received', 'text': "Hello, this is customer service......"});
  }

  void _handleSendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({'type': 'sent', 'text': text});

      _textController.clear();
    });

    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        _messages.add({
          'type': 'received',
          'text': "We will contact you soon. Thank you for reaching out!",
        });
      });
    });
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
                  return SentTile(message: msg['text']!, sent: 'just now');
                } else {
                  return ReceivedTile(message: msg['text']!, sent: 'just now');
                }
              },
            ),
          ),
          MessageTextField(controller: _textController, onSend: _handleSendMessage),
        ],
      ),
    );
  }
}
