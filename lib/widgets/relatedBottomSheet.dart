import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/relatedNewsModel.dart';

class RelatedBottomSheet extends StatelessWidget {
  RelatedBottomSheet({super.key});

  late Size size;

  final List<RelatedNewsModel> _relatedNewsList = [
    RelatedNewsModel(
      image: "assets/images/related1.png",
      headline: "Liz Truss will be UK’s next Prime Minister?",
    ),
    RelatedNewsModel(
      image: "assets/images/related2.png",
      headline: "British Pound will fall after Prime Minister elections?",
    ),
    RelatedNewsModel(
      image: "assets/images/related3.png",
      headline: "British Railway Strikes will end by before Sept. 2022?",
    ),
    RelatedNewsModel(
      image: "assets/images/related1.png",
      headline: "Liz Truss will be UK’s next Prime Minister?",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Container(
              height: 4,
              width: 80,
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Related",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff687684),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/icons/cancel.png',
                      height: 28,
                      width: 28,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 22,
                    width: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xff2B2828),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Top",
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 22,
                    width: 72,
                    decoration: BoxDecoration(
                      color: const Color(0xff7D7D7D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Newest",
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: const Color(0xff2B2B2B).withOpacity(0.1),
              height: 12.0,
              thickness: 1.0,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: _relatedNewsList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemBuilder: (context, index) => Container(
                width: size.width - 36,
                height: 68,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xffCED5DC),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Image.asset(
                        _relatedNewsList[index].image,
                        fit: BoxFit.cover,
                        height: 68,
                        width: 72,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _relatedNewsList[index].headline,
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff141619),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
