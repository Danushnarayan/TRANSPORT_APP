import 'package:flutter/material.dart';
import 'live_tracking.dart'; // Importing the Live Tracking page

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
    final Map<String, List<String>> busRoutes = {
    "1. Ennore Bus Stand - 5.45 am": [
      "Ennore Bus Stand - 5.45 am",
      "Ernavur Anna Nagar - 5.48",
      "Lift Gate - 5.54",
      "Wimco Nagar - 6.00",
      "Thiruvottiyur Bus Terminal - 6.01",
      "Periar Nagar - 6.02",
      "Vellayan Chettiyar School - 6.03",
      "Thiruvottiyur Market - 6.04",
      "Theradi - 6.05",
      "Raja Kadai - 6.06",
      "Ellaiyamman Kovil - 6.07",
      "Kaladipet Market - 6.08",
      "Thangal - 6.09",
      "Tollgate - 6.11",
      "Kasimedu Signal - 6.13",
      "Kalmandapam - 6.16",
      "Clive Battery - 6.20",
      "Via: Non Stop Beach Station, Parrys, Central, Koyambedu Roundtana, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],
    "1C. Tollgate (Thiruvottiyur) - 6.05 am": [
      "Lakshmi Koil - 6.05 am",
      "Tondiarpet Depot - 6.06",
      "Kasimedu - 6.10",
      "Kasimedu Petrol Bunk - 6.11",
      "Kalmandapam Police Station - 6.13",
      "ST Anne's School - 6.14",
      "Royapuram Bridge - 6.16",
      "Beach Station - 6.20",
      "Annamalai Mandram - 6.23",
      "GH (Rajiv Gandhi Hospital) - 6.25",
      "Everest Hotel - 6.27",
      "Neyveli House - 6.31",
      "KMC - 6.32",
      "Via - Non stop: Koyambedu Roundtana, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],
    "2. Tondiarpet - 6.10 am": [
      "Tondiarpet Mani Cycle Shop - 6.10 am",
      "Maharani (Singapore Shoppee) - 6.13",
      "Cementry Road - 6.14",
      "Pencil Factory - 6.15",
      "Mint Old Bus Stop - 6.16",
      "Mint New Bus Stand - 6.17",
      "Basin Bridge - 6.18",
      "Padmanaba Theater - 6.20",
      "Elephant Gate Police Station - 6.23",
      "Via - Non stop: KMC, Aminjikarai, Koyambedu Roundtana, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],
    "2C. Ajax - 5.50 am": [
      "Ajax Bus Depot - 5.50 am",
      "Periyar Nagar - 5.57",
      "Ellaiamman Kovil - 6.00",
      "Mint Old Bus Stand - 6.15",
      "Mint New Bus Stand - 6.16",
      "Padmanabha Theatre - 6.18",
      "Via - Non Stop Koyambedu Roundtana, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],
    "3. Choolai - 6.15 am": [
      "Choolai Post Office - 6.15 am",
      "Veperi Police Station - 6.20",
      "Saravana Stores - Pursaiwakkam - 6.25",
      "Gangadeeswarar Koil - 6.27",
      "Alagappa Road - 6.30",
      "Pathala Ponniammam Koil - 6.31",
      "Motcham Theatre - 6.32",
      "Mummy Daddy - 6.35",
      "Via - Non Stop Koyambedu Roundtana, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],
    "3C. Doveton Bridge - 6.15 am": [
      "Muthumariamman Kovil (Doveton Bridge) - 6.15 am",
      "Kellys - Signal - 6.30",
      "Murugan Hospital - 6.35",
      "Kallarai Road - 6.37",
      "Periyapalayathamman Temple - 6.38",
      "Shenoy Nagar Bus Stop - 6.40",
      "Via - Non Stop Koyambedu Roundtana, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],
    "4. Chintadripet - 6.15 am": [
      "Chintadripet Fish Market - 6.15 am",
      "Chintadripet Market - 6.17",
      "Chintadripet Police Quarters - 6.18",
      "Pudupet - 6.20",
      "Egmore Court - 6.22",
      "Rajarthinam Stadium - 6.25",
      "Egmore (Co-Optex) Bridge - 6.28",
      "Halls Road Junction - 6.30",
      "Spurtank Road - 6.32",
      "Chepet Signal - 6.35",
      "Harington Road Junction - 6.37",
      "Via - Non Stop Koyambedu Roundtana, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],
    "4C. Loyola College - 6.35 am": [
      "Loyola College - 6.35 am",
      "Nungambakkam Railway Station - 6.38",
      "Mehta Nagar - 6.40",
      "Pantaloon - 6.43",
      "Skywalk - 6.45",
      "Anna Arch - 6.48",
      "Arumbakkam - Indian Hospital - 6.50",
      "Via - Non Stop Koyambedu, Maduravoyal, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],
  };


  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),

                // ✅ College Logo
                _buildCollegeLogo(),
                SizedBox(height: 20),

                // 🏛 College Name
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

                // 🚧 Metro Work Alert
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

                // 🔍 Search Bar
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

                // 🚌 Bus Schedule
                _buildLargeInfoCard(Icons.directions_bus, "Morning to College",
                    "131 buses in All routes"),
                _buildLargeInfoCard(Icons.wb_sunny_rounded,
                    "Forenoon to College", "6 buses in Main routes"),
                _buildLargeInfoCard(Icons.schedule, "Return after 3:45 PM",
                    "125 buses in All routes"),
                _buildLargeInfoCard(Icons.nightlife, "Return after 5:00 PM",
                    "6 buses in Main routes"),
                _buildLargeInfoCard(Icons.night_shelter, "Return after 7:20 PM",
                    "6 buses in Main routes"),

                SizedBox(height: 20),

                // 📍 Bus Routes List
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: busRoutes.keys.where((busName) {
                    return searchQuery.isEmpty ||
                        busName.toLowerCase().contains(searchQuery) ||
                        busRoutes[busName]!.any(
                            (stop) => stop.toLowerCase().contains(searchQuery));
                  }).map((busName) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        child: ExpansionTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueGrey.shade800,
                            child:
                                Icon(Icons.directions_bus, color: Colors.white),
                          ),
                          title: Text(
                            busName,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo.shade900),
                          ),
                          children: busRoutes[busName]!
                              .map((stop) => ListTile(
                                    title: Text(stop,
                                        style:
                                            TextStyle(color: Colors.black87)),
                                  ))
                              .toList(),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20),

                // 📍 Live Location Button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LiveTrackingPage()),
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

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ College Logo Widget
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

  // 🏷 Info Cards
  Widget _buildLargeInfoCard(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white.withOpacity(0.9),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey.shade800,
              child: Icon(icon, color: Colors.white, size: 35),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade900)),
                  SizedBox(height: 5),
                  Text(subtitle,
                      style: TextStyle(fontSize: 16, color: Colors.black87)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
