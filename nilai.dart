import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NilaiSiswaScreen extends StatefulWidget {
  @override
  _NilaiSiswaScreenState createState() => _NilaiSiswaScreenState();
}

class _NilaiSiswaScreenState extends State<NilaiSiswaScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  String _kategori = '';
  String _errorMessage = '';
  double? _rataRata;

  void _hitungKategori() {
    setState(() {
      _kategori = '';
      _errorMessage = '';
      _rataRata = null;

      final nilai1 = int.tryParse(_controller1.text);
      final nilai2 = int.tryParse(_controller2.text);
      final nilai3 = int.tryParse(_controller3.text);

      if (nilai1 == null || nilai1 < 0 || nilai1 > 100 || 
          nilai2 == null || nilai2 < 0 || nilai2 > 100 || 
          nilai3 == null || nilai3 < 0 || nilai3 > 100) {
        _errorMessage = 'Masukkan nilai yang valid (0-100) untuk ketiga input.';
        return;
      }

      _rataRata = (nilai1 + nilai2 + nilai3) / 3;

      if (_rataRata! >= 85) {
        _kategori = 'Kategori: A';
      } else if (_rataRata! >= 70) {
        _kategori = 'Kategori: B';
      } else if (_rataRata! >= 55) {
        _kategori = 'Kategori: C';
      } else {
        _kategori = 'Kategori: D';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengelompokan Nilai Siswa'),
        titleTextStyle:TextStyle(
          color: Colors.tealAccent,
          fontSize: 45,
          fontWeight: FontWeight.bold

        ),
        backgroundColor: Colors.black, // Warna tema header hitam
      ),
      backgroundColor: Colors.black, // Background hitam
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.grey[850], // Warna Card abu-abu gelap
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller1,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.tealAccent), // Teks input putih
                      decoration: InputDecoration(
                        labelText: 'Masukkan Nilai Siswa 1 (0-100)',
                        labelStyle: TextStyle(color: Colors.tealAccent), // Label putih
                        errorText: _errorMessage.isEmpty ? null : _errorMessage,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent), // Border putih
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent), // Border fokus
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _controller2,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.tealAccent),
                      decoration: InputDecoration(
                        labelText: 'Masukkan Nilai Siswa 2 (0-100)',
                        labelStyle: TextStyle(color: Colors.tealAccent),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _controller3,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: const Color.fromARGB(255, 255, 100, 183)),
                      decoration: InputDecoration(
                        labelText: 'Masukkan Nilai Siswa 3 (0-100)',
                        labelStyle: TextStyle(color: Colors.tealAccent),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _hitungKategori,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent, // Tombol warna teal
                        padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Hitung Rata-rata',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black, // Teks hitam di tombol
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_rataRata != null)
              Card(
                color: Colors.grey[900], // Warna Card lebih gelap
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Rata-rata: ${_rataRata!.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.tealAccent, // Teks warna teal
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _kategori,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.tealAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
