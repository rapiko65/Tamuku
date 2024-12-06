// Suggested code may be subject to a license. Learn more: ~LicenseLog:4113266672.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3198164931.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2976575085.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2904164521.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2808013686.
import 'package:flutter/material.dart';
import 'db/db_helper.dart'; // Sesuaikan dengan lokasi file DatabaseHelper
import 'main.dart';
import 'info_page.dart'; // Import file info.dart

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 0; // Indeks untuk BottomNavigationBar

  Future<void> _deleteAllData(BuildContext context) async {
    final db = await DatabaseHelper.instance.database;

    try {
      await db.delete('guests'); // Hapus semua data di tabel 'guests'
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Semua data tamu berhasil dihapus!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan saat menghapus data.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pengaturan',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Gunakan opsi berikut untuk mengelola aplikasi Tamuku.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Konfirmasi'),
                  content: Text('Apakah Anda yakin ingin menghapus semua data tamu?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context); // Tutup dialog
                        await _deleteAllData(context); // Hapus data
                      },
                      child: Text(
                        'Hapus',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.delete, color: Colors.white),
            label: Text('Hapus Semua Data Tamu',style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
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
            // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          } else if (index == 1) {
            // Navigasi ke halaman Home (halaman saat ini, tidak perlu navigasi)
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())); // Gunakan pushReplacement untuk mencegah stack navigasi menumpuk
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
