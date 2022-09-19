import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthmate_task/models/commentsModel.dart';
import 'package:growthmate_task/models/relatedNewsModel.dart';
import 'package:growthmate_task/models/researchNewsListModel.dart';
import 'package:growthmate_task/widgets/relatedBottomSheet.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widgets/reactionsBottomSheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;

  int selectedTab = 0;

  final List<String> _tabs = [
    "Research & News",
    "Reactions",
    "Related",
  ];

  final List<ResearchNewsListModel> _researchNewsListItems = [
    ResearchNewsListModel(
      title: "Thehill",
      date: "1 Sept",
      description:
          "Last week, the dire warnings that appeared in the Wall Street Journal, The Economist and Foreign Affairs about China's imminent war with or...",
    ),
    ResearchNewsListModel(
      title: "BBC",
      date: "1 Sept",
      description:
          "Most people the BBC spoke to do not believe China is about to attack Taiwan. \"They're a bunch of gangsters,\" said one man fishing on the...",
    ),
    ResearchNewsListModel(
      title: "BBC",
      date: "1 Sept",
      description:
          "Most people the BBC spoke to do not believe China is about to attack Taiwan. \"They're a bunch of gangsters,\" said one man fishing on the...",
    ),
  ];

  final List<RelatedNewsModel> _relatedNewsList = [
    RelatedNewsModel(
      image: "assets/images/related1.png",
      headline: "Liz Truss will be UK’s next Prime Minister?",
    ),
    RelatedNewsModel(
      image: "assets/images/related2.png",
      headline: "British Pound will fall after Prime Minister elections?",
    ),
  ];

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

  onTabNavigation(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          headlineWidget(),
          changeWidget(),
          tabBar(),
          selectedTab == 0
              ? researchNewsTabItem()
              : selectedTab == 1
                  ? reactionsTabItem()
                  : relatedTabItem(),
        ],
      ),
    );
  }

  Widget headlineWidget() => SizedBox(
        height: size.height * 0.4,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/soldier.png",
              alignment: Alignment.center,
              fit: BoxFit.cover,
              height: size.height * 0.4,
              width: size.width,
            ),
            Container(
              height: size.height * 0.4,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xff1A1A1A).withOpacity(0.8),
                    const Color(0xff131313).withOpacity(0.3),
                    const Color(0xff0B0B0B).withOpacity(0.0),
                    const Color(0xff000000).withOpacity(0.0),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          "assets/icons/share.png",
                          height: 20,
                          width: 20,
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Will China invade Taiwan\n before end september?",
                          style: GoogleFonts.lato(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Image.asset(
                          "assets/icons/filter.png",
                          height: 20,
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget changeWidget() => SizedBox(
        height: 80,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 80,
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff2E20DB),
                    Color(0xffE432C1),
                  ],
                ),
              ),
            ),
            Image.asset(
              "assets/icons/flying_coins.png",
              height: 80,
              fit: BoxFit.fitHeight,
              color: Colors.white.withOpacity(0.2),
            ),
            SizedBox(
              height: 80,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CHANGE",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "11%",
                            style: GoogleFonts.montserratAlternates(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffFFFFFF),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Image.asset(
                            "assets/icons/arrow-up.png",
                            height: 26,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "24H",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffFFFFFF),
                                ),
                              ),
                              Text(
                                "+25495\$",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$09",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 20,
                        width: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff21FFAA),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 5,
                              color: const Color(0xff000000).withOpacity(0.25),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Yes",
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff292929),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$89",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 20,
                        width: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffE432C1),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 5,
                              color: const Color(0xff000000).withOpacity(0.25),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "No",
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget tabBar() => Container(
        width: size.width,
        padding: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffCED5DC),
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < _tabs.length; i++)
              GestureDetector(
                onTap: () => onTabNavigation(i),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _tabs[i],
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: selectedTab == i
                            ? const Color(0xffE432C1)
                            : const Color(0xff687684),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 2,
                      width: 80,
                      color: selectedTab == i
                          ? const Color(0xffE432C1)
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
          ],
        ),
      );

  Widget researchNewsTabItem() => Expanded(
        child: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "215 Expert Opinion",
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff687684),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 10,
                            color: const Color(0xffC930C5).withOpacity(0.1),
                          ),
                        ),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffC930C5).withOpacity(0.2),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "12%",
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: const Color(0xffE432C1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: size.width - 132,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            progressIndicator(
                              percent: 0.12,
                              barColor: const Color(0xffE432C1),
                              label: "12% Buy Yes",
                            ),
                            progressIndicator(
                              percent: 0.88,
                              barColor: const Color(0xff687684),
                              label: "88% Buy No",
                            ),
                            progressIndicator(
                              percent: 0.01,
                              barColor: const Color(0xff687684),
                              label: "1% No Resolve",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                researchNewsList(),
              ],
            ),
          ),
        ),
      );

  Widget progressIndicator(
          {required double percent,
          required Color barColor,
          required String label}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.44,
            child: LinearPercentIndicator(
              backgroundColor: const Color(0xffD9D9D9),
              alignment: MainAxisAlignment.start,
              barRadius: const Radius.circular(3),
              lineHeight: 6,
              progressColor: barColor,
              percent: percent,
              animationDuration: 500,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: barColor,
            ),
          ),
        ],
      );

  Widget researchNewsList() => SizedBox(
        height: 100,
        width: size.width,
        child: ListView.separated(
          itemCount: _researchNewsListItems.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemBuilder: (context, index) => Container(
            height: 80,
            width: size.width * 0.6,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xffFFFFFF),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: const Color(0xff000000).withOpacity(0.25),
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _researchNewsListItems[index].title,
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff2E2E2E),
                      ),
                    ),
                    Text(
                      _researchNewsListItems[index].date,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff080808),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _researchNewsListItems[index].description,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff000000),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ),
      );

  Widget reactionsTabItem() => Expanded(
        child: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/mentions.png',
                        height: 21,
                        width: 21,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "215",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff687684),
                        ),
                      ),
                      const SizedBox(width: 28),
                      Image.asset(
                        'assets/icons/comments.png',
                        height: 18,
                        width: 18,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "95K",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff687684),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemCount: _allComments.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => ReactionsBottomSheet(),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            child: RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: _allComments[index].name,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      height: 1.7,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: _allComments[index].comment,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      height: 1.15,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const SizedBox(width: 68),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "Add comment",
                          hintStyle: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            height: 1.7,
                            color: const Color(0xff999999),
                          ),
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "😍 😭",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  height: 1,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff141619),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Image.asset(
                                'assets/icons/add.png',
                                height: 16,
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget relatedTabItem() => Expanded(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: _relatedNewsList.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => RelatedBottomSheet(),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      "more...",
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff999999),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ],
          ),
        ),
      );
}
