import 'package:flutter/material.dart';

class Bottomtabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;
  Bottomtabs({this.selectedTab, this.tabPressed});
  @override
  _BottomtabsState createState() => _BottomtabsState();
}

class _BottomtabsState extends State<Bottomtabs> {

  int _selectedTab = 0;
  
  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1.0,
                  blurRadius: 30.0)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomBtn(
              imagePath: 'assets/images/tab_home.png',
              selected: _selectedTab == 0 ? true : false,
              onPressed: (){
                setState(() {
                  widget.tabPressed(0);
                });
              },
            ),
            BottomBtn(
              imagePath: 'assets/images/tab_search.png',
              selected: _selectedTab == 1 ? true : false,
              onPressed: (){
                setState(() {
                   widget.tabPressed(1);
                });
              },
            ),
            BottomBtn(
              imagePath: 'assets/images/tab_saved.png',
              selected: _selectedTab == 2 ? true : false,
              onPressed: (){
                setState(() {
                   widget.tabPressed(2);
                });
              },
            ),
            BottomBtn(
              imagePath: 'assets/images/tab_logout.png',
              selected: _selectedTab == 3 ? true : false,
              onPressed: (){
                setState(() {
                   widget.tabPressed(3);
                });
              },
            ),
          ],
        ));
  }
}

class BottomBtn extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function onPressed;
  BottomBtn({this.imagePath, this.selected, this.onPressed});
  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 24.0),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: _selected
                        ? Theme.of(context).accentColor
                        : Colors.transparent,
                    width: 2.0))),
        child: Image(
          image: AssetImage(imagePath ?? 'assets/images/tab_home.png'),
          width: 22.0,
          height: 22.0,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}
