import 'package:booking_management_dashboard/constants/ConstantsImage.dart';
import 'package:booking_management_dashboard/utils/responsive_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WebVerticalNavWidget extends StatefulWidget {
  final SizingInformation sizingInformation;

  const WebVerticalNavWidget({Key key, this.sizingInformation})
      : super(key: key);

  @override
  _WebVerticalNavWidgetState createState() => _WebVerticalNavWidgetState();
}

class _WebVerticalNavWidgetState extends State<WebVerticalNavWidget> {
  int _buttonCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: ResponsiveScreen().webHeightMediaQuery(context, 25)),
      width: ResponsiveScreen().webWidthMediaQuery(context, 55),
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 2,
              offset: Offset(0.5, 0.0),
              spreadRadius: 2)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logoWidget(),
          _colButtons(),
          _logoutButton(),
        ],
      ),
    );
  }

  Widget _logoWidget() {
    return Container(
      width: 45,
      height: 45,
      child: Image.asset(ConstantsImages.LOGO),
    );
  }

  Widget _colSingleButton({IconData icon, Color borderColor, Color iconColor}) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: ResponsiveScreen().webHeightMediaQuery(context, 38)),
      child: Container(
        width: ResponsiveScreen().webWidthMediaQuery(context, 70),
        child: Icon(
          icon,
          color: iconColor,
        ),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 2,
              color: borderColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _colButtons() {
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                setState(() {
                  _buttonCurrentIndex = 0;
                });
              },
              child: _colSingleButton(
                  icon: Icons.widgets,
                  iconColor:
                      _buttonCurrentIndex == 0 ? Colors.indigo : Colors.black,
                  borderColor: _buttonCurrentIndex == 0
                      ? Colors.deepOrange
                      : Colors.transparent)),
          InkWell(
              onTap: () {
                setState(() {
                  _buttonCurrentIndex = 1;
                });
              },
              child: _colSingleButton(
                  icon: Icons.score,
                  iconColor:
                      _buttonCurrentIndex == 1 ? Colors.indigo : Colors.black,
                  borderColor: _buttonCurrentIndex == 1
                      ? Colors.deepOrange
                      : Colors.transparent)),
          InkWell(
            onTap: () {
              setState(() {
                _buttonCurrentIndex = 2;
              });
            },
            child: _colSingleButton(
                icon: Icons.calendar_today,
                iconColor:
                    _buttonCurrentIndex == 2 ? Colors.indigo : Colors.black,
                borderColor: _buttonCurrentIndex == 2
                    ? Colors.deepOrange
                    : Colors.transparent),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _buttonCurrentIndex = 3;
              });
            },
            child: _colSingleButton(
                icon: Icons.pages,
                iconColor:
                    _buttonCurrentIndex == 3 ? Colors.indigo : Colors.black,
                borderColor: _buttonCurrentIndex == 3
                    ? Colors.deepOrange
                    : Colors.transparent),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _buttonCurrentIndex = 4;
              });
            },
            child: _colSingleButton(
                icon: Icons.message,
                iconColor:
                    _buttonCurrentIndex == 4 ? Colors.indigo : Colors.black,
                borderColor: _buttonCurrentIndex == 4
                    ? Colors.deepOrange
                    : Colors.transparent),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _buttonCurrentIndex = 5;
              });
            },
            child: _colSingleButton(
                icon: Icons.settings,
                iconColor:
                    _buttonCurrentIndex == 5 ? Colors.indigo : Colors.black,
                borderColor: _buttonCurrentIndex == 5
                    ? Colors.deepOrange
                    : Colors.transparent),
          ),
        ],
      ),
    );
  }

  Widget _logoutButton() {
    return Icon(Icons.exit_to_app);
  }
}
