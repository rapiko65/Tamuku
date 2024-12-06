import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'db/db_helper.dart'; // Import database helper

class TambahTamuPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  TambahTamuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Tamu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final String name = nameController.text;
                final String address = addressController.text;

                if (name.isNotEmpty && address.isNotEmpty) {
                  // Ambil waktu saat ini
                  final String currentDate =
                      DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

                  // Simpan ke database
                  await DatabaseHelper.instance.addGuest(name, address, currentDate);

                  // Tampilkan pesan sukses
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data berhasil ditambahkan'),
                    ),
                  );

                  // Kosongkan field input
                  nameController.clear();
                  addressController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Harap isi semua field'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
