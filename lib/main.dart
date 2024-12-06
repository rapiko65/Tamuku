// Suggested code may be subject to a license. Learn more: ~LicenseLog:3148511285.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2103594361.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3692417589.
import 'package:flutter/material.dart';
import 'list_tamu_page.dart';
import 'tambah_tamu_page.dart';
import 'db/db_helper.dart';
import 'info_page.dart';
import 'setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const HomeScreen({super.key});

    @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, int> guestData = {};
  int _selectedIndex = 1; // Indeks untuk halaman Home

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
        title: const Text('Tamuku', style: TextStyle(color: Colors.black)),
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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            ),
            child: const Column(
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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            ),
            child: const Column(
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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            ),
            child: const Column(
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
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          // Contoh penggunaan navigasi:
          if (index == 0) {
            // Navigasi ke halaman Settings (ganti dengan halaman Settings Anda)
            // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          } else if (index == 1) {
            // Navigasi ke halaman Home (halaman saat ini, tidak perlu navigasi)
          } else if (index == 2) {
            // Navigasi ke halaman Info (ganti dengan halaman Info Anda)
            Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage()));
          }

          // Anda perlu mengganti SettingsPage() dan InfoPage() dengan halaman
          // yang sesuai di aplikasi Anda.
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: _selectedIndex == 0 ? Colors.blue : null,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: _selectedIndex == 1 ? Colors.blue : null,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
            backgroundColor: _selectedIndex == 2 ? Colors.blue : null,
          ),
        ],
        selectedItemColor: Colors.blue, // Warna teks item yang dipilih
        unselectedItemColor: Colors.grey, // Warna teks item yang tidak dipilih
      ),
    );
  }
}


