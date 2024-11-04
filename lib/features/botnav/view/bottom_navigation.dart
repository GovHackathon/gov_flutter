import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gov_hackathon/features/profile/view/profile_view.dart';
import 'package:gov_hackathon/features/survei/view/survei_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  PageController pageController = PageController();

  List views = [
    const SurveiView(),
    const Center(
      child: Text("2"),
    ),
    const ProfileView(),
  ];

  int currentIndex = 0;

  void nextPage(index) {
    setState(() {
      currentIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: PageView.builder(
          controller: pageController,
          itemCount: views.length,
          itemBuilder: (context, index) => views[index],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () => nextPage(1),
        child: Container(
          decoration: BoxDecoration(
            color: currentIndex == 1 ? const Color(0xff1C8D55) : Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 4,
              color: const Color(0xff1C8D55),
            ),
          ),
          height: 80,
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                currentIndex == 1
                    ? "assets/icons/gpt_on.svg"
                    : "assets/icons/gpt.svg",
                height: 30,
                width: 30,
              ),
              Text(
                "ChatBot",
                style: TextStyle(
                  fontSize: 12,
                  color: currentIndex == 1
                      ? Colors.white
                      : const Color(0xff1C8D55),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height / 11,
        shape: const CircularNotchedRectangle(),
        notchMargin: 15,
        child: Row(
          children: [
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              child: InkWell(
                onTap: () => nextPage(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      currentIndex == 0
                          ? "assets/icons/note_on.svg"
                          : "assets/icons/note.svg",
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      "Survei",
                      style: TextStyle(
                        fontSize: 12,
                        color: currentIndex == 0
                            ? const Color(0xff1C8D55)
                            : const Color(0xff68696F),
                        fontWeight: currentIndex == 0
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(flex: 5),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: InkWell(
                onTap: () => nextPage(2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      currentIndex == 2
                          ? "assets/icons/profile_on.svg"
                          : "assets/icons/profile.svg",
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 12,
                        color: currentIndex == 2
                            ? const Color(0xff1C8D55)
                            : const Color(0xff68696F),
                        fontWeight: currentIndex == 2
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
