import 'package:flutter/material.dart';

// Chatbot Widget to be included in the RoutePage
class BusChatbot extends StatefulWidget {
  final Map<String, List<String>> busRoutes;

  BusChatbot({required this.busRoutes});

  @override
  _BusChatbotState createState() => _BusChatbotState();
}

class _BusChatbotState extends State<BusChatbot> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _addBotMessage(
      "👋 Hi there! I'm your REC Bus Assistant. Ask me about bus routes or stops, and I'll help you find the right bus!",
    );
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;

    _messageController.clear();
    FocusScope.of(context).unfocus(); // ✅ Dismiss keyboard after input

    setState(() {
      _messages.add(ChatMessage(
        text: text.trim(),
        isUserMessage: true,
      ));
    });

    _scrollToBottom();
    _getBotResponse(text.trim());
  }

  void _addBotMessage(String message) {
    setState(() {
      _messages.add(ChatMessage(
        text: message,
        isUserMessage: false,
      ));
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // ✅ Updated to ignore "via" and "non stop"
  void _getBotResponse(String query) {
    query = query.toLowerCase();

    // ✅ Check for greetings first
    if (_isGreeting(query)) {
      _addBotMessage("Hello! How can I help you with bus routes today?");
      return;
    }

    // 🚌 Check for matching bus routes and stops
    List<String> foundBuses = [];
    for (var busKey in widget.busRoutes.keys) {
      final stops = widget.busRoutes[busKey]
              ?.where((stop) => !stop.toLowerCase().contains("via") && !stop.toLowerCase().contains("non stop"))
              .map((stop) => stop.toLowerCase()) ??
          [];

      // ✅ Match bus name or stop
      if (busKey.toLowerCase().contains(query) ||
          stops.any((stop) => stop.contains(query))) {
        foundBuses.add(busKey);
      }
    }

    if (foundBuses.isNotEmpty) {
      String response = "I found ${foundBuses.length} bus(es):\n\n";
      for (var bus in foundBuses) {
        response += "🚌 $bus\n";
      }
      response += "\nFor more details, tap on a bus route in the list below.";
      _addBotMessage(response);
    } else {
      _addBotMessage(
        "Sorry, I couldn't find any buses matching '$query'. Try asking about specific areas or bus routes.",
      );
    }
  }

  bool _isGreeting(String text) {
    text = text.toLowerCase(); // ✅ Convert to lowercase here
    List<String> greetings = [
      'hi', 'hello', 'hey', 'greetings',
      'good morning', 'good afternoon', 'good evening'
    ];
    return greetings.any((greeting) => text.contains(greeting));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          // 🟢 Chat Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.indigo.shade800,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                "REC Bus Assistant",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 💬 Messages Area
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),

          // ✍️ Input Area
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "Ask about bus routes...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    ),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.indigo.shade800),
                  onPressed: () => _handleSubmitted(_messageController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 💬 ChatMessage Widget
class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({
    required this.text,
    required this.isUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUserMessage)
            CircleAvatar(
              backgroundColor: Colors.indigo.shade800,
              child: const Icon(Icons.directions_bus, color: Colors.white),
              radius: 16,
            ),
          if (!isUserMessage) const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isUserMessage ? Colors.indigo.shade800 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isUserMessage ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
