import 'package:flutter/material.dart';
import 'package:gov_hackathon/core/components/primary_date_picker.dart';
import 'package:gov_hackathon/core/components/primary_text_field.dart';

class FamilyDataView extends StatelessWidget {
  const FamilyDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Keluarga",
          style: TextStyle(
            color: Color(0xff1C8D55),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            PrimaryTextField(
              hintText: "Puri Lalita Anagatha",
              title: "Nama Ibu",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            PrimaryTextField(
              hintText: "Syahreza Adnan Al Azhar",
              title: "Nama Anak",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            PrimaryTextField(
              hintText: "6101012005010001",
              title: "NIK Anak",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            PrimaryTextField(
              hintText: "Laki Laki",
              title: "Jenis Kelamin",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            const PrimaryDatePicker(title: "Tanggal Lahir"),
            const SizedBox(height: 20),
            const PrimaryDatePicker(title: "Tanggal Lahir Anak"),
            const SizedBox(height: 20),
            PrimaryTextField(
              hintText: "1 Bulan",
              title: "Usia Anak",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            PrimaryTextField(
              hintText: "1 Bulan",
              title: "Usia Anak",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            PrimaryTextField(
              controller: TextEditingController(),
              hintText: "54 cm",
              title: "Tinggi Badan Anak",
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(0),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            backgroundColor: const WidgetStatePropertyAll(Color(0xff1C8D55)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text("Simpan"),
        ),
      ),
    );
  }
}
