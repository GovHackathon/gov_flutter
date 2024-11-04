import 'package:flutter/material.dart';
import 'package:gov_hackathon/core/components/primary_drop_down.dart';
import 'package:gov_hackathon/core/components/primary_text_field.dart';
import 'package:gov_hackathon/core/resources/colors.dart';

class SurveiView extends StatelessWidget {
  const SurveiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Survei",
          style: TextStyle(
            color: GovColors.colorPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            const Text(
              "Kesehatan dan Gizi Keluarga",
              style: TextStyle(
                color: GovColors.colorPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            PrimaryTextField(
              hintText: "",
              title: "Jenis makanan pokok yang sering dikonsumsi",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            PrimaryDropDown(
              title: "Bagaimana akses terhadap makanan bergizi?",
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            PrimaryDropDown(
              title:
                  "Seberapa sering anda memberikan makanan bergizi kepada anak anda?",
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            PrimaryDropDown(
              title:
                  "Seberapa sering anda memeriksa kesehatan anda difasilitas kesehatan?",
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            PrimaryDropDown(
              title:
                  "Apakah anak anda pernah didiagnosis mengalami gizi kurang atau stunting oleh tenaga kesehatan?",
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            PrimaryDropDown(
              title: "Dari mana sumber air yang biasa keluarga anda gunakan?",
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            PrimaryDropDown(
              title:
                  "Tolong jelaskan sumber air yang biasa keluarga anda gunakan?",
              onChanged: (val) {},
            ),
            const SizedBox(height: 20),
            PrimaryDropDown(
              title:
                  "Darimanakah anda mendapatkan informasi kesehatan mengenai anak anda?",
              onChanged: (val) {},
            )
          ]),
        ),
      ),
    );
  }
}
