import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffC4ECE9),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 16, 16, 16),
                child: Row(children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/yazid.png"),
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Naraya Anggraini"),
                      SizedBox(height: 8),
                      Text("3576014403910003")
                    ],
                  ),
                  Spacer(flex: 8)
                ]),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              tileColor: const Color(0xffC4ECE9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text(
                "Data Keluarga",
                style: TextStyle(
                  color: Color(0xff195728),
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.family_restroom,
                color: Color(0xff195728),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ListTile(
              tileColor: const Color(0xffC4ECE9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text(
                "History Survei",
                style: TextStyle(
                  color: Color(0xff195728),
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.history,
                color: Color(0xff195728),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ListTile(
              tileColor: const Color(0xffC4ECE9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xffC10B0B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.logout,
                color: Color(0xffC10B0B),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
