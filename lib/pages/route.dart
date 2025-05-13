// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'live_tracking.dart';
import 'bus_chatbot.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  // Track which route dropdowns are expanded
  Map<String, bool> _expandedRoutes = {};
  
  // Keep track of filtered bus routes for efficiency
  List<String> filteredBusRoutes = [];
  final Map<String, List<String>> busRoutes = {
    "12. MKB Nagar - 6.15 am": [
      "MKD Nagar - 6.17",
      "MR Nagar - 6.20",
      "Erukancherry - 6.22",
      "Non Stop via - Chennai Outer Ring Road.",
      "College campus - 7.40 am"
    ],
    "12A. Erukkanchery - 6.25 am": [
      "Madhavaram Roundtana - 6.30",
      "Retteri RTO Office - 6.35",
      "Korattur Police Station - 6.50",
      "Ambattur Telephone Exchange - 6.55",
      "Non Stop via - Chennai Bypass Road",
      "College campus - 7.40 am"
    ],
    "12B. Kolathur - 6.30 am": [
      "Welding Shop - 6.35",
      "Kolathur Junction - 6.40",
      "Retteri Signal - 6.42",
      "Non Stop via - Chennai Outer Ring Road",
      "College campus - 7.40 am"
    ],
  };

  String searchQuery = "";
  bool _isChatbotVisible = false;

  @override
  void initState() {
    super.initState();
    filteredBusRoutes = busRoutes.keys.toList();
  }
  
  @override
  Widget build(BuildContext context) {
    filteredBusRoutes = busRoutes.keys.where((busName) {
      return searchQuery.isEmpty ||
          busName.toLowerCase().contains(searchQuery) ||
          busRoutes[busName]!.any((stop) => stop.toLowerCase().contains(searchQuery));
    }).toList();
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade900, Colors.purple.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    _buildCollegeLogo(),
                    SizedBox(height: 20),
                    Text(
                      "Rajalakshmi Engineering College",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.shade700.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.warning_amber_rounded,
                              color: Colors.white, size: 30),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "⚠ Metro Work Alert: Some boarding points skipped (Routes 27 & 27C). No buses via Poonamallee.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      onChanged: (query) {
                        setState(() {
                          searchQuery = query.toLowerCase();
                        });
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search for a bus stop...",
                        hintStyle: TextStyle(color: Colors.white70),
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: Colors.purple.shade700,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    // Info cards in a 2x2 grid layout
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _buildLargeInfoCard(Icons.directions_bus, "Morning to College", "131 buses"),
                              SizedBox(height: 12),
                              _buildLargeInfoCard(Icons.schedule, "Return after 3:45 PM", "125 buses"),
                              SizedBox(height: 12),
                              _buildLargeInfoCard(Icons.nightlife, "Return after 5:00 PM", "6 buses"),
                              SizedBox(height: 12),
                              _buildLargeInfoCard(Icons.nightlife, "Total Buses", "152 buses"),

                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            children: [
                              _buildLargeInfoCard(Icons.wb_sunny_rounded, "Forenoon to College", "6 buses"),
                              SizedBox(height: 12),
                              _buildLargeInfoCard(Icons.night_shelter, "Return after 7:20 PM", "6 buses"),
                              SizedBox(height: 12),
                              SizedBox(height: _calculateCardHeight()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 25),
                    
                    // Bus Routes Title
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade700,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_bus_filled_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 12),
                          Text(
                            "Bus Routes",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 15),
                    
                    // Single column of bus routes - one per row
                    Column(
                      children: filteredBusRoutes.map((routeName) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: _buildBusRouteCard(routeName),
                        );
                      }).toList(),
                    ),
                    
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LiveTrackingPage()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueAccent.shade700,
                              Colors.deepPurpleAccent.shade400
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueAccent.shade700.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          "📍 Live Location",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
              
              // Chatbot Icon
              Positioned(
                bottom: 30,
                right: 30,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isChatbotVisible = !_isChatbotVisible;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.shade700,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.chat,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              
              if (_isChatbotVisible)
                Positioned(
                  bottom: 100,
                  right: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade900,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bus Assistant Chatbot",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    _isChatbotVisible = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: BusChatbot(busRoutes: busRoutes),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  double _calculateCardHeight() {
    return 72.0;
  }

  Widget _buildCollegeLogo() {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
      child: Image.asset(
        'lib/images/rec.png',
        width: 180,
        height: 180,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.error, color: Colors.red, size: 80);
        },
      ),
    );
  }

  // New bus route card design - one per row
  Widget _buildBusRouteCard(String routeName) {
    bool isExpanded = _expandedRoutes[routeName] ?? false;
    
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(1, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  routeName,
                  style: TextStyle(
                    color: Colors.indigo.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.indigo.shade900,
                ),
                onTap: () {
                  setState(() {
                    _expandedRoutes[routeName] = !isExpanded;
                  });
                },
              ),
              if (isExpanded)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: busRoutes[routeName]!.map((stop) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Text(
                          stop,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLargeInfoCard(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.zero,
      color: Colors.white.withOpacity(0.9),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blueGrey.shade800,
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade900
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.black87)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}