import 'package:flutter/material.dart';
import 'list_tamu_page.dart';
import 'tambah_tamu_page.dart';
import 'db/db_helper.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tamuku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
    @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, int> guestData = {};

  @override
  void initState() {
    super.initState();
    _fetchGuestData();
  }

  // Mengambil data dari database (sesuaikan dengan implementasi Anda)
  Future<void> _fetchGuestData() async {
    final data = await DatabaseHelper.instance.getGuestCountPerDay();
    setState(() {
      guestData = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tamuku', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar dan teks di bagian atas
            
              // Header teks
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Selamat datang di tamuku",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
              // Tombol
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TambahTamuPage(),
                        ),
                      );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Warna latar belakang
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Radius border
              ),
              elevation: 4, // Shadow
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_add, // Icon
                  color: Colors.white, // Warna icon
                  size: 40,
                ),
                SizedBox(height: 8),
                Text(
                  'Tambah Tamu',
                  style: TextStyle(
                    color: Colors.white, // Warna teks
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
                  ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Warna latar belakang
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Radius border
              ),
              elevation: 4, // Shadow
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.bar_chart, // Icon
                  color: Colors.white, // Warna icon
                  size: 40,
                ),
                SizedBox(height: 8),
                Text(
                  'Chart Bulanan',
                  style: TextStyle(
                    color: Colors.white, // Warna teks
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
                  ElevatedButton(
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListTamuPage(),
                        ),
                      );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Warna latar belakang
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Radius border
              ),
              elevation: 4, // Shadow
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_add, // Icon
                  color: Colors.white, // Warna icon
                  size: 40,
                ),
                SizedBox(height: 8),
                Text(
                  'List Tamu',
                  style: TextStyle(
                    color: Colors.white, // Warna teks
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}


