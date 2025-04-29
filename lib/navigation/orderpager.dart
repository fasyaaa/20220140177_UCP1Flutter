import 'package:flutter/material.dart';
import 'package:ucp1/navigation/detailorderpage.dart';
import 'package:ucp1/navigation/homepage.dart';
import 'package:intl/intl.dart';

class Orderpager extends StatefulWidget {
  const Orderpager({super.key});

  @override
  State<Orderpager> createState() => _OrderpagerState();
}

class _OrderpagerState extends State<Orderpager> {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jenisTransaksiController =
      TextEditingController();
  String? _selectedTransaksiValue;
  final List<String> jenisTransaksi = ['Barang Masuk', 'Barang Keluar'];
  final TextEditingController jenisBarangController = TextEditingController();
  String? _selectedBarangValue;
  final List<String> jenisBarang = [
    'Carrier',
    'Sleeping Bag',
    'Tenda',
    'Sepatu',
  ];
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController hargaSatuanBarangController =
      TextEditingController();
  int totalHargaBarang = 0;
  final _formKey = GlobalKey<FormState>();

  void hitungTotalHarga() {
    int jumlahBarang = int.tryParse(jumlahBarangController.text) ?? 0;
    int hargaSatuanBarang = int.tryParse(hargaSatuanBarangController.text) ?? 0;

    setState(() {
      totalHargaBarang = jumlahBarang * hargaSatuanBarang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 187, 69),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homepage(email: ''),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  Text(
                    'Pendataan Barang',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pilih Tanggal',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: tanggalController,
                            decoration: InputDecoration(
                              hintText: 'Pilih Tanggal',
                              prefixIcon: Icon(Icons.calendar_month),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());

                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: Color.fromARGB(
                                          255,
                                          23,
                                          109,
                                          26,
                                        ),
                                      ),
                                      datePickerTheme: DatePickerThemeData(
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          181,
                                          246,
                                          183,
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (pickedDate != null) {
                                tanggalController.text = DateFormat(
                                  'EEEE, dd MMMM yyyy',
                                ).format(pickedDate);
                              }

                              FocusScope.of(context).unfocus();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter date!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 50),
                          DropdownButtonFormField<String>(
                            value: _selectedTransaksiValue,
                            decoration: InputDecoration(
                              labelText: 'Pilih Transaksi',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Pilih jenis transaksi';
                              }
                              return null;
                            },
                            items:
                                jenisTransaksi.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedTransaksiValue = newValue;
                                jenisTransaksiController.text = newValue!;
                              });
                            },
                          ),
                          SizedBox(height: 50),
                          DropdownButtonFormField<String>(
                            value: _selectedBarangValue,
                            decoration: InputDecoration(
                              labelText: 'Pilih Barang',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Pilih jenis barang';
                              }
                              return null;
                            },
                            items:
                                jenisBarang.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedBarangValue = newValue;
                                jenisBarangController.text = newValue!;
                              });
                            },
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jumlah Barang',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    TextFormField(
                                      controller: jumlahBarangController,
                                      decoration: InputDecoration(
                                        hintText: 'Jumlah Barang',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Jumlah Barang tidak boleh kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 25),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Harga Satuan',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    TextFormField(
                                      controller: hargaSatuanBarangController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: 'Harga Satuan',
                                        isDense: true,
                                        prefix: Text(
                                          'Rp.  ',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 12,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Harga Satuan tidak boleh kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  hitungTotalHarga();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => Detailorderpage(
                                            tanggal: tanggalController.text,
                                            jenisTransaksi:
                                                jenisTransaksiController.text,
                                            jenisBarang:
                                                jenisBarangController.text,
                                            jumlahBarang:
                                                jumlahBarangController.text,
                                            hargaSatuanBarang:
                                               int.parse(hargaSatuanBarangController.text),
                                               totalHarga: totalHargaBarang,
                                          ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  65,
                                  187,
                                  69,
                                ),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: Text('Simpan'),
                            ),
                          ),
                        ],
                      ),
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
