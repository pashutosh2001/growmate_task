import 'package:flutter/material.dart';

import 'homepage.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late PageController _pageController;

  late Size size;

  int currentIndex = 0;

  final List<String> _bnbItems = [
    "assets/icons/news.png",
    "assets/icons/markets.png",
    "assets/icons/portfolio.png",
    "assets/icons/profile.png",
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomePage(),
            Center(child: Text(currentIndex.toString())),
            Center(child: Text(currentIndex.toString())),
            Center(child: Text(currentIndex.toString())),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < _bnbItems.length; i++)
              Container(
                height: 28,
                width: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      i == currentIndex
                          ? const Color(0xffF21CC8)
                          : Colors.transparent,
                      i == currentIndex
                          ? const Color(0xffFD9FEB)
                          : Colors.transparent,
                    ],
                  ),
                ),
                child: Image.asset(
                  _bnbItems[i],
                  height: 24,
                  width: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
