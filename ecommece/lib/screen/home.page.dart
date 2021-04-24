import 'package:ecommece/widgets/bottom.tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  int _selectedtab;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (num) {
                setState(() {
                  _selectedtab = num;
                });
              },
              children: [
                Container(child: Center(child: Text('HomePage'))),
                Container(child: Center(child: Text('SearchPage'))),
                Container(child: Center(child: Text('SavePage'))),
              ],
            ),
          ),
          Bottomtabs(
            selectedTab: _selectedtab,
            tabPressed: (num) {
              setState(() {
                pageController.animateToPage(num, duration: Duration(milliseconds: 300), curve: Curves.easeOutCubic);
              });
            },
          )
        ],
      ),
    );
  }
}
