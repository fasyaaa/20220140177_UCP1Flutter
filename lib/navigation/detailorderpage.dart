import 'package:flutter/material.dart';
import 'package:ucp1/navigation/homepage.dart';

class Detailorderpage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final String jumlahBarang;
  final int hargaSatuanBarang;
  final int totalHarga;

  const Detailorderpage({
    super.key,
    required this.tanggal,
    required this.jenisBarang,
    required this.hargaSatuanBarang,
    required this.jenisTransaksi,
    required this.jumlahBarang,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> detailItems = [
      {'label': 'Tanggal', 'value': tanggal},
      {'label': 'Jenis Transaksi', 'value': jenisTransaksi},
      {'label': 'Jenis Barang', 'value': jenisBarang},
      {'label': 'Jumlah Barang', 'value': jumlahBarang},
      {
        'label': 'Jenis Harga Satuan',
        'value': 'Rp. ${hargaSatuanBarang.toString()}',
      },
      {'label': 'Total Harga', 'value': 'Rp. ${totalHarga.toString()}'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F7),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text(
              'Data Berhasil Disimpan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children:
                    detailItems
                        .map(
                          (item) => Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item['label']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    item['value']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              const Divider(thickness: 1),
                            ],
                          ),
                        )
                        .toList(),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed:
                      () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homepage(email: ''),
                        ),
                        (route) => false,
                      ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 65, 187, 69),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
