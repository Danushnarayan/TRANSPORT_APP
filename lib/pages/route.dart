import 'package:flutter/material.dart';
import 'live_tracking.dart'; // Importing the Live Tracking page
import 'bus_chatbot.dart'; // Importing the Bus Chatbot

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
    "5. Chintamani": [
    "Chintamani - 6.30 am",
    "K3 Police Station - 6.33",
    "Razack Garden - 6.35",
    "MMDA - 6.38",
    "MMDA Bus Depot - 6.40",
    "Vallavan Hotel - 6.43",
    "SAF Games Village - 6.48",
    "Via - Non Stop Madhuravoil, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],
    // 5B. Maduravoyal Erikarai
    "5B. Maduravoyal Erikarai": [
      "Maduravoyal Erikarai - 6.50 am",
      "Vanagaram Bus Stop - 6.55",
      "Shrivari Signal - 6.57",
      "Velappanchavadi (Harsha Toyota) - 7.00",
      "Via - Non Stop Madhuravoil, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],

    // 5C. Thirunagar (Ambica Empire Hotel)
    "5C. Thirunagar (Ambica Empire Hotel)": [
      "Thirunagar (Ambica Empire Hotel) - 6.40 am",
      "Vallavan Hotel - 6.42",
      "SAF Games Village - 6.44",
      "Vijayakanth Kalayana Mandapam - 6.45",
      "Toyota Show Room - 6.47",
      "Nerkundram - 6.50",
      "Vengaya Mandi - 6.52",
      "College Campus - 7.40 am"
    ],

    // 6. New Avadi Road Water Tank
    "6. New Avadi Road Water Tank": [
      "New Avadi Road Water Tank - 6.25 am",
      "Gangaiamman Koil - 6.27",
      "Lotus Colony - 6.29",
      "14- Shop - 6.34",
      "Kandasamy College - 6.36",
      "Nalli Silks - 6.38",
      "Ayyappan Temple - 6.40",
      "Blue Star - 6.42",
      "Tower Park Metro Station - 6.44",
      "Santhosh Super Market - 6.46",
      "Hot Chips - 6.48",
      "Senthil Nursing Home - 6.50",
      "CPWD Quarters - 6.52",
      "Via - Non Stop Koyambedu Roundtana, Poonamallee Bypass",
      "College Campus - 7.40 am"
    ],

    // 7. Anna Nagar East
    "7. Anna Nagar East": [
      "Anna Nagar RTO Office - 6.35 am",
      "Anna Nagar East 1st Avenue - 6.37",
      "Anna Nagar East 6th Avenue - 6.39",
      "Chennai Mobiles - 6.41",
      "K4 Police Station - 6.43",
      "Kovai Palamuthircholai - 6.45",
      "Akshyam Hotel - 6.47",
      "Nuts Piczs - 6.49",
      "SBI Bank - 6th Avenue - 6.51",
      "Bata Show Room - 6.53",
      "Vijaya Maruthi - 6.55",
      "Reliance Fresh - 6.57",
      "Via - Non Stop Tambaram Ex Highway, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],

    // ... (I'll continue adding the rest below) ...
    "7A. Collector Nagar": [
      "Vellammal School - 6.45 am",
      "Golden Flats - 6.48",
      "7M Bus Stand - 6.53",
      "VGN Service Road - 6.59",
      "Via - Non Stop Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],

    "7C. Wavin": [
      "Thirumangalam EB Bus Stop - 6.40 am",
      "Collector Nagar - 6.45",
      "GEM Flats - 6.46",
      "TSK Nagar - 6.47",
      "Velammal / DAV - 6.48",
      "Via - Non Stop Tambaram Express Highway, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],

    "8. SIDCO Villivakkam": [
      "SIDCO Villivakkam - 6.40 am",
      "Singarampillai School - 6.42",
      "Anbu Colony - 6:44",
      "Anna Nagar West Depot - 6.45",
      "Via - Non Stop Thambram Exp. Highway, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],

    "8C. Waves": [
      "HP Petrol Bunk - 6.40 am",
      "Waves - 6.43",
      "V3 JJ Nagar Police Booth - 6.45",
      "Dharma Fancy Store (Veeramunivar Rd Jn) - 6.46",
      "Chandra Studio - 6:47",
      "IOB Mugapair East - 6.48",
      "Ooty Vegetables - 6.49",
      "Water Tank - 6.50",
      "Via - Non Stop Tambaram Express Highway, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],

    "9. Mogappair East": [
      "Spartan School - 6.40 am",
      "Mogappair East Bus Stop (7H) - 6.43",
      "Via - Non Stop Tambaram Express Highway, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],

    "9A. Mogappair (Golden Flat)": [
      "Golden Flat - 6.45 am",
      "SBI - 6.55",
      "Greater Chennai Corporation Park - 6.59",
      "VGN Service Road - 7.01",
      "MGR University - 7.05",
      "Via - Non Stop Chennai Outer Ring Road, Poonamallee Byepass",
      "College Campus - 7.40 am"
    ],

    "9B. Mogappair": [
      "Grace Super Market - 6.45 am",
      "Ambedkar Ground - 6.46",
      "Velammal School (Mogappair West) - 6.47",
      "Mogappair Water Tank Road - 6.49",
      "(7M) Amutha Matri. School - 6.51",
      "Via - Non Stop Tambaram Express Highway, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],

    "9C. Mogappair West": [
      "DRJ Super Market - 6.50 am",
      "SBI - 6.52",
      "Via - Non Stop Tambaram Express Highway, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],

    "10. Pulianthop Police Station": [
      "Pulianthop Police Station - 6.16 am",
      "Pattalam - 6.18",
      "Dasamahan - 6.20",
      "Podikadai Bus Stop - 6.22",
      "Sayani Theatre - 6.25",
      "Venkatesapuram Colony - 6.26",
      "HP Petrol Bunk - 6.27",
      "K2 Police Station - 6.28",
      "Joint Office - 6.30",
      "Railway Quarters Bus Stop - 6.33",
      "Via - Non Stop Lucas, Wavin, Tambaram Express Highway, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],

    "10C. Binny Mill Church": [
      "Binny Mill Church - 6.20 am",
      "Kambar Arangam - 6.35",
      "ICF Signal - 6.37",
      "Kallukadai Bus Stop - 6.38",
      "Villivakkam Kalpana Hotel - 6.39",
      "Nadhamuni Theatre - 6.40",
      "Via - Non Stop Padi, Wavin, Tambaram Express Highway, Poonamallee Bye Pass",
      "College Campus - 7.40 am"
    ],
    "11. Moolakadai": [
    "Erukkancheri ABR Kalyana Mandapam - 6.15 am",
    "Erukkancheri - Rajalakshmi Cars Showroom - 6.20",
    "Moolakadai - 6.25",
    "M1 Police Station - 6.27",
    "Kanakan Chatram (Shell Petrol Bunk) - 6.29",
    "Kalpana Lamps - 6.31",
    "Madhavaram Andhra Bus Stand - 6.33",
    "Retteri RTO Office - 6.35",
    "Non Stop via - Padi, Wavin, Tambaram Highway, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  "11C. Korattur": [
    "Korattur Police Station - 6.30 am",
    "Bakthavatchalam School Signal - 6.35",
    "Church - 6.37",
    "Via - Non Stop Tambaram Exp. Highway, Poonamallee ByPass",
    "College Campus - 7.40 am"
  ],

  // 12. MKB Nagar
  "12. MKB Nagar": [
    "MKB Nagar - 6.15 am",
    "MKD Nagar - 6.17",
    "MR Nagar - 6.20",
    "Erukancherry - 6.22",
    "Non Stop via - Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "12A. Erukkanchery": [
    "Erukkanchery - 6.25 am",
    "Madhavaram Roundana - 6.30",
    "Retteri RTO Office - 6.35",
    "Korattur Police Station - 6.50",
    "Ambattur Telephone Exchange - 6.55",
    "Non Stop via - Chennai Bypass Road",
    "College Campus - 7.40 am"
  ],

  "12B. Kolathur": [
    "Ajantha Bakery - 6.30 am",
    "Welding Shop - 6.35",
    "Kolathur Junction - 6.40",
    "Retteri Signal - 6.42",
    "Non Stop via - Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "12C. Perambur": [
    "Don Bosco School - 6.00 am",
    "Square Brothers Info Tech - 6.02",
    "Lakshmi Amman Koil (Ramana Nagar) - 6.04",
    "Easwari Mahal - 6.06",
    "BP Road - 6.09",
    "Perambur Bus Depo - 6.14",
    "Perambur Rly Station - 6.15",
    "Perumbur Church - 6.18",
    "Ajantha Bakers - 6.20",
    "Venus Bus Stop - 6.23",
    "Non Stop via - Wavin, Thambaram Express Highway, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  // 13. Peravallur
  "13. Peravallur": [
    "Peravalur - 6.20 am",
    "Jawahar Nagar Bus Stop - 6.22",
    "Axis Bank - 6.23",
    "Agaram BPCL Bunk - 6.25",
    "Thiruvalluvar Kalyanamandabam - 6.26",
    "Periyar Nagar Bus Stand - 6.28",
    "Kolathur Don Bosco School - 6.30",
    "Kolathur US Hospitals - 6.33",
    "Non Stop via - Tambaram Ex Highway, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  "13A. Kolathur (Don Bosco School)": [
    "Kolathur (Don Bosco School) - 6.30 am",
    "Temple School - 6.35",
    "Saravana Store (Padi) - 6.40",
    "Korattur Signal - 6.42",
    "Britannia - 6.45",
    "Non Stop via - Tambram Ex Highway, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  "13B. TVK Nagar": [
    "Paneswari Amman Koil - 6.20 am",
    "K 9 Thiru.Vi.Ka.Nagar Police Station - 6.22",
    "Sai Baba Temple - 6.23",
    "Thiru.Vi.Ka. Nagar Bus Terminal - 6.25",
    "T.V.K Nagar Market - 6.26",
    "Via - Non Stop Madhavaram Exp Highway, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  "13C. Poombukar Nagar": [
    "Chicken Shop - 6.30 am",
    "Poombukar Nagar Post Office - 6.32",
    "Grace Super Market - 6.35",
    "Rajamangalam Signal (Reliance) - 6.36",
    "Non Stop via - Tambram Ex Highway, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  // 14. Minjur
  "14. Minjur": [
    "Rice Mill - 5.50 am",
    "Kattur Koot Road - 5.55",
    "BDO Office - 6.00",
    "Patamanthri - 6.05",
    "Manali New Town - 6.15",
    "Vichoor - 6.20",
    "Andarkuppam Check Post - 6.25",
    "Manjampakkam Ring Road - 6.40",
    "Non Stop via - Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "14C. Veterinary College (Mathur)": [
    "Manali Market - 6.15 am",
    "Shastri Nagar - 6.20",
    "Mathur 3rd Main Road - 6.22",
    "Mathur 1st Main Road - 6.24",
    "Veterinary College - 6.26",
    "Arul Nagar - 6.28",
    "Thapalpetti - 6.30",
    "Madhavaram Old Bus Stand - 6.35",
    "Madhavaram New Bus Stand - 6.38",
    "Non Stop via - Padi, Wavin, Tambaram Highway, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  // 15. Ayappakkam
  "15. Ayappakkam": [
    "Dunlop - 6.27 am",
    "Canara Bank - 6.30",
    "TI School Road - 6.32",
    "Cake World - Ambattur - 6.35",
    "Murugappa Polytechnic - 6.43",
    "Non Stop via - Chennai Outer Ring Road, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  "15A. Ayappakkam Water Tank": [
    "Ayappakkam Water Tank - 6.40 am",
    "VGN Platina - 6.43",
    "Aparna Nagar - 6.45",
    "Shivan Koil - 6.48",
    "Koladi HP Petrol Bunk - 6.50",
    "Thiruverkadu Bus Stand - 6.52",
    "Pallavan Nagar - 6.55",
    "VGN Mahalakshmi Apartments - 6.58",
    "Velapanchavadi Kendra Vihar Apartment - 7.00",
    "Non Stop via - Chennai Outer Ring Road, Poonamallee Bypass",
    "College Campus - 7.40 am"
  ],

  "15B. Thirumullaivoyal": [
    "Thirumullaivoyal - 6.42 am",
    "Vaishnawi Nagar - 6.43",
    "Avadi Bus Stand - 6.44",
    "Outer Ring Road Bye Pass - Chokanallur - 7.00",
    "Via - Non Stop Chennai Outer Ring Road, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  "15C. Ambattur OT": [
    "Singapore Shopping - 6.30 am",
    "Sir Ivan Stedford Hospital - 6.33",
    "Non Stop via - Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "15D. Ayappakkam Church (Water Tank)": [
    "Ayappakkam Church (Water Tank) - 6.35 am",
    "Pillaiyar Kovil - 6.38",
    "ICMR - 6.40",
    "Selvi Mahal - 6.43",
    "Ration Shop - 6.45",
    "Via - Non Stop Chennai Outer Ring Road, Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  // 16. Ponneri
  "16. Ponneri": [
    "Krishnapuram (Ponneri) - 5.50 am",
    "Andarkuppam - 5.55",
    "Velammal School - 5.57",
    "Thachoor Koot Road - 6.00",
    "Panchati - 6.03",
    "Irulipattu - 6.06",
    "Janapachathiram Koot Road - 6.08",
    "Karanodai - 6.10",
    "Cholavaram - 6.12",
    "Padiyanallur - 6.15",
    "MA Nagar - 6.18",
    "Redhills Bye Pass - 6.22",
    "Redhills Market - 6.25",
    "Redhills Bus Stand - 6.28",
    "Redhills Koot Road - 6.30",
    "Via - Non Stop Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "16A. Kallikuppam": [
    "Surapet - 6.25 am",
    "Kallikuppam Arch - 6.30",
    "Wireless - 6.32",
    "Oragadam - 6.35",
    "PTR Kalyanamanadapam - 6.36",
    "Ajay Stadium - 6.45",
    "Via - Non Stop Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "16B. RedHills Bypass": [
    "Sothupakkam Signal - 6.25 am",
    "SSR Palace - 6.30",
    "Nel Arisi Kalyana Mandapam (Signal) - 6.32",
    "Redhills Market - 6.35",
    "Redhills Bus Stand - 6.37",
    "Alamaram - 6.42",
    "Gandhi Nagar - 6.45",
    "Petrol Bunk (Pammathukulam) - 6.47",
    "Outer Ring Road Bridge - 6.50",
    "Perumal Adipatham - 6.52",
    "Saint Michaels Polytechnic - 6.55",
    "Via - Non Stop Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "16C. Puzhal Byepass": [
    "Kavankarai - 6.20 am",
    "Puzhal Jail - 6.22",
    "Puzhual Camp - 6.23",
    "Shanmugapuram - 6.30",
    "Pudur - 6.35",
    "Via - Non Stop Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "16D. Puzhal": [
    "Umayal Achi Nursing College - 6.25 am",
    "Velammal College - 6.27",
    "Singapore Shopping - 6.35",
    "Stedford Hospital - 6.40",
    "Moorthy Nagar - 7.00",
    "Via - Non Stop Bangalore Highway",
    "College Campus - 7.40 am"
  ],

  "16E. Oragadam (Ambattur)": [
    "Oragadam - PTR Kalyana Mandapam - 6.30 am",
    "Stedford - 6.35",
    "Saraswathi Nagar - 6.40",
    "Avadi Check Post - 6.50",
    "Paruthipattu - 7.00",
    "Non Stop via - Poonamallee Bye Pass",
    "College Campus - 7.40 am"
  ],

  // 17. Uthukottai
  "17. Uthukottai": [
    "Uthukottai Bus Stand - 5.45 am",
    "Peruncheri - 5.55",
    "Seethancheri - 6.02",
    "Poondi Koot Road - 6.15",
    "Thiruvallur - Meera Theatre - 6.30",
    "Thiruvallur GRT - 6.42",
    "College Campus - 7.40 am"
  ],

  "17A. Kakkalur": [
    "Kakkalur Bus Stop - 6.35 am",
    "Manavalanagar Railway Station - 6.50",
    "NDP Mahal - 6.52",
    "Ondikuppam (Sangeetha Hotel) - 6.54",
    "Putlur Bus Stop - 7.00",
    "Aranvoyal Bus Stop - 7.05",
    "Thirumazhisai Bus Stand - 7.20",
    "Via - Non Stop Bangalore Highway",
    "College Campus - 7.40 am"
  ],

  "17B. Thiruvallur": [
    "Vasantha Bhavan Hotel - 6.50 am",
    "State Bank of India - 6.52",
    "Oil Mill - 6.55",
    "Caterpillar - 7.05",
    "Melnallathur - 7.08",
    "TCL - 7.10",
    "Athikulam - 7.12",
    "Via - Non Stop Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "17C. Veppampattu": [
    "Veppampattu Tea Kadai - 6.25 am",
    "Kandankollai - 6.30",
    "Chevappettai - 6.35",
    "Tholuvur - 6.40",
    "Thaneerkulam - 6.45",
    "Thiruvalur GRT - 6.55",
    "Via - Non Stop Thiruvalur - Poonamalle Road",
    "College Campus - 7.40 am"
  ],

  "17D. Thirunindravur": [
    "Veppampattu Rly Station - 6.35 am",
    "Veppampattu Rly 2nd Gate - 6.38",
    "Thirunindravur - Murugan Koil - 6.45",
    "Thirunindravur - 6.50",
    "Nadukuthagai - 6.53",
    "Jaya College - 6.55",
    "Nemelichery Roundana - 7.00",
    "Via - Non Stop Bangalore Highway",
    "College Campus - 7.40 am"
  ],

  // 18. Avadi
  "18. Avadi": [
    "Avadi Ramarathinam - 6.40 am",
    "Ponnu Supermarket - 6.42",
    "JB Estate - 6.45",
    "Via - Non Stop Poonamallee Bypass",
    "College Campus - 7.40 am"
  ],

  "18A. Ambattur Stedford Hospital": [
    "JB Estate - 7.00 am",
    "Vasantham Nagar - 7.02",
    "Paruthipattu Police Booth - 7.06",
    "Kaduvetti - 7.07",
    "Bharat Bunk - 7.08",
    "Via - Non Stop Bangalore Highway",
    "College Campus - 7.40 am"
  ],

  "18B. Avadi (GRT)": [
    "Avadi Pillyarkoil - 6.50 am",
    "Kavarapalayam - 6.51",
    "Sindhu Nagar - 6.53",
    "Sekkadu - 6.54",
    "Hindu College - 6.58",
    "Pattabiram Bridge - 7.00",
    "Via - Non Stop Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "18C. Avadi Market": [
    "Govarthnagiri - 6.46 am",
    "Ayankulam - 6.47",
    "Paruthipatu - 6.49",
    "Kaduveti - 6.50",
    "Seneerkuppam - 6.51",
    "Via - Non Stop Poonmallee Byepass",
    "College Campus - 7.40 am"
  ],

  "18D. Avadi (Veerapuram)": [
    "Kollumedu GH - 6.05 am",
    "Kannadapalayam - 6.07",
    "Vel Tech Junction - 6.15",
    "Kovilpathagai - 6.20",
    "Ajay Stadium - 6.25",
    "Kalainar Nagar - 6.27",
    "Brinda Nagar - 6.30",
    "CRPF Junction - 6.45",
    "Mittanemili - 6.48",
    "Via - Non Stop Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  // 19. Chengalpet
  "19. Chengalpet": [
    "Chengalpet GH - 5.45 am",
    "Chengalpet Rotanakenar - 5.47",
    "Chengalpet New Bus Stop - 5.50",
    "Chengalpet Old Bus Stop - 5.52",
    "Mahindra City - 6.10",
    "SP Koil - 6.15",
    "Via - Non Stop Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "19A. Perungalathur": [
    "Perungalathur Bus Stop - 6.40 am",
    "Perungalathur Earikarai - 6.43",
    "Irumpuliyur - 6.46",
    "Old Tambaram Kulam - 6.48",
    "Lakshmipuram - 6.50",
    "Krishnanagar - 6.53",
    "Via - Non Stop Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "19B. Varatharaja Theatre": [
    "Varatharaja Theatre - 6.35 am",
    "Santorium - 6.38",
    "Bharathamada Street - 6.42",
    "Bharathi Nagar - 6.48",
    "Gandhi Nagar - 6.49",
    "Padmavathy Kalyanamandapam - 6.50",
    "Parvathy Nagar - 6.52",
    "Outer Ring Road (Service Road) - 6.55",
    "Via - Non Stop Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "19C. Hasthinapuram": [
    "Hasthinapuram Bus Stand - 6.30 am",
    "Amman Koil - 6.32",
    "Kumaran Kundram - 6.35",
    "Bharathi Nagar Auto Stand - 6.37",
    "Tambaram Gandhi Road - 6.50",
    "Madanapuram Bridge (Outer Ring Road) - 6.55",
    "Via - Non Stop Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "19D. Guduvanchery": [
    "Guduvanchery Bus Stand - 6.30 am",
    "Guduvanchery EB - 6.32",
    "Urapakkam Tea Kadai - 6.34",
    "Urapakkam School Stop - 6.36",
    "Vandalur - 6.40",
    "Via - Non Stop Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  // 20. Kamatchi Hospital (Pallikaranai)
  "20. Kamatchi Hospital (Pallikaranai)": [
    "Kamachi Hospital - 6.15 am",
    "Narayanapuram - 6.17",
    "Pallikaranai Oil Mill - 6.19",
    "Pallikaranai Govt School - 6.21",
    "Pallikaranai Jayachandran - 6.23",
    "Nilgiris Supermarket - 6.25",
    "Via - Non Stop Tambaram, Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "20A. Medavakkam X Road": [
    "Medavakkam X Road - 6.30 am",
    "Puthukoil Bus Stop - 6.32",
    "Santhoshpuram Signal - 6.35",
    "Sembakkam Signal - 6.40",
    "Rajakilpakkam Signal - 6.42",
    "Via - Non Stop Tambaram, Chennai Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "20B. Padur": [
    "Siruseri Roundtana - 5.50 am",
    "Padur Market - 5.53",
    "Hindustan College - 6.00",
    "Kelambakkam (Vandalur X Road) - 6.03",
    "Pudupakkam - 6.06",
    "Mambakkam - 6.10",
    "Mambakkam Sivan Koil - 6.15",
    "Thiruvanchery - 6.30",
    "Theeder Nagar - 6.33",
    "Lakshmi Ammal College - 6.37",
    "Bharath Engineering College - 6.40",
    "Indra Nagar - 6.42",
    "Malar Hospital - 6.45",
    "Via - Non Stop Tambaram Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "20C. Madipakkam": [
    "Ponniamman Koil - 6.15 am",
    "PNB Bank - 6.18",
    "Sathasiva Nagar - 6.20",
    "Ram Nagar - 6.22",
    "Kaiveli Signal - 6.28",
    "Via - Non Stop Tambaram Outer Ring Road",
    "College Campus - 7.40 am"
  ],

  "20D. Nanmangalam": [
    "Nanmangalam - 6.25 am",
    "Vadakupattu Road - 6.27",
    "Vellakal - 6.29",
    "Kamarajapuram - 6.35",
    "Mahalakshmi Nagar - 6.38",
    "Selaiyur - 6.42",
    "Sankara Vidyalaya School - 6.43",
    "Poondi Bazaar - 6.44",
    "Tambaram Railway Station - 6.45",
    "Via - Non Stop Tambaram Outer Ring Road",
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

                // 💬 Chatbot Section
                Text(
                  "Bus Assistant Chatbot",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                BusChatbot(busRoutes: busRoutes),
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
