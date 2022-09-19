import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/commentsModel.dart';

class ReactionsBottomSheet extends StatelessWidget {
  ReactionsBottomSheet({super.key});

  late Size size;

  final List<CommentsModel> _allComments = [
    CommentsModel(
      image: 'assets/images/reaction1.png',
      name: "Linda",
      time: "1h ago",
      comment:
          "If China does indeed attack Taiwan soon, October is the likely time since the Taiwan Strait waters will be calm, facilitating amphibious operations. The drills around Taiwan allowed China to build up forces in Fujian, which is part of what's needed before an invasion.",
      numberOfReplies: 5,
    ),
    CommentsModel(
      image: 'assets/images/reaction2.png',
      name: "TomBN",
      time: "1h ago",
      comment:
          "I will be surprised if #China will in fact attack Taiwan. Doing so requires lots of courage, which China lacks.",
      numberOfReplies: 2,
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
                    "Reactions",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  )
                ],
              ),
            ),
            Divider(
              color: const Color(0xff2B2B2B).withOpacity(0.1),
              height: 12.0,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Remember to keep comments respectful and to follow our ",
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        color: const Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text: "Community Guidelines",
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        color: const Color(0xff1A73FD),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                ClipOval(
                  child: Image.asset(
                    "assets/images/profilePic.png",
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Add comment",
                        hintStyle: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: const Color(0xff999999),
                        ),
                        border: InputBorder.none,
                        suffixIcon: Image.asset(
                          'assets/icons/add.png',
                          height: 20,
                          width: 20,
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          maxHeight: 21,
                          minHeight: 20,
                          minWidth: 20,
                          maxWidth: 21,
                        )),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            Divider(
              color: const Color(0xff2B2B2B).withOpacity(0.1),
              height: 12.0,
              thickness: 1.0,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: _allComments.length,
              itemBuilder: (context, index) => Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: index % 2 == 0
                              ? const Color(0xffE432C1)
                              : const Color(0xff687684),
                          width: 1.0,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          _allComments[index].image,
                          fit: BoxFit.cover,
                          height: 36,
                          width: 36,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_allComments[index].name} \u2022 ${_allComments[index].time}",
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              height: 1.7,
                              color: const Color(0xff000000),
                            ),
                          ),
                          Text(
                            _allComments[index].comment,
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.15,
                              color: const Color(0xff000000),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/like.png',
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                'assets/icons/dislike.png',
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                'assets/icons/like2.png',
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${_allComments[index].numberOfReplies} REPLIES",
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.7,
                              color: const Color(0xff1A73FD),
                            ),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
