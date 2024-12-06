// Suggested code may be subject to a license. Learn more: ~LicenseLog:3192981566.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1584023672.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2211974855.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:656319989.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3480684759.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1222430017.
import 'package:flutter/material.dart';
import 'main.dart'; // Import MainPage
import 'setting.dart'; // Import MainPage

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int _selectedIndex = 2; // Index untuk InfoPage dalam BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tentang Tamuku',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Tamuku adalah aplikasi manajemen data tamu yang dirancang untuk mempermudah pencatatan dan pelacakan tamu dalam suatu acara, kantor, atau tempat usaha. '
            'Dengan antarmuka yang sederhana dan mudah digunakan, Tamuku memungkinkan Anda untuk:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          BulletPoint(text: 'Mencatat data tamu secara real-time.'),
          BulletPoint(text: 'Melihat daftar tamu yang sudah terdaftar.'),
          BulletPoint(text: 'Mengelola data tamu dengan mudah.'),
          BulletPoint(text: 'Menyimpan data secara aman dan terorganisir.'),
          SizedBox(height: 16),
          Text(
            'Fitur Utama',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          BulletPoint(text: 'Formulir pendaftaran tamu dengan data lengkap.'),
          BulletPoint(text: 'Filter pencarian untuk tamu tertentu.'),
          BulletPoint(text: 'Tampilan daftar tamu yang rapi dan interaktif.'),
          BulletPoint(text: 'Export data tamu ke format Excel atau PDF.'),
          SizedBox(height: 16),
          Text(
            'Mengapa Memilih Tamuku?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Tamuku membantu Anda menghemat waktu dan tenaga dalam pengelolaan data tamu, '
            'sehingga Anda dapat fokus pada aktivitas lainnya. Aplikasi ini cocok untuk berbagai kebutuhan seperti acara pernikahan, seminar, hingga kantor.',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Center(
            child: Text(
              'Versi Aplikasi: 1.0.0',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ],
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          } else if (index == 1) {
            // Navigasi ke halaman Home (halaman saat ini, tidak perlu navigasi)
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_circle, color: Colors.blue, size: 20),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
