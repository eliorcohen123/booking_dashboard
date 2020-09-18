import 'dart:async';
import 'package:booking_management_dashboard/constants/ConstantsImage.dart';
import 'package:booking_management_dashboard/model/data_model_firebase.dart';
import 'package:booking_management_dashboard/utils/responsive_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:websafe_svg/websafe_svg.dart';

class BodyContentWidget extends StatefulWidget {
  @override
  _BodyContentWidgetState createState() => _BodyContentWidgetState();
}

class _BodyContentWidgetState extends State<BodyContentWidget> {
  int _rowCurrentBtnIndex = 0;
  final Stream<QuerySnapshot> _snapshots =
      Firestore.instance.collection('bookingData').orderBy('date').snapshots();
  StreamSubscription<QuerySnapshot> _bookingSub;
  List<DataModelFirebase> _dataBooking = [];
  bool _isDisplayGrid = true;

  @override
  void initState() {
    super.initState();

    _readFirebase();
  }

  @override
  void dispose() {
    super.dispose();

    _bookingSub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveScreen().webWidthMediaQuery(context, 1097),
      child: Column(
        children: [
          _headerWidget(),
          _quickStatsWidget(),
          _rowButtons(),
          SizedBox(
            height: ResponsiveScreen().webHeightMediaQuery(context, 5),
          ),
          _isDisplayGrid ? _gridListItems() : _listViewItems(),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      margin: EdgeInsets.only(
          bottom: ResponsiveScreen().webHeightMediaQuery(context, 15)),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveScreen().webWidthMediaQuery(context, 20),
        vertical: ResponsiveScreen().webHeightMediaQuery(context, 10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DashBoard",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: ResponsiveScreen().webHeightMediaQuery(context, 5),
              ),
              Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveScreen().webWidthMediaQuery(context, 20),
              vertical: ResponsiveScreen().webHeightMediaQuery(context, 10),
            ),
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text(
              "Customise Blocks",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _quickStatsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ResponsiveScreen().webWidthMediaQuery(context, 20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Stats",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          ResponsiveScreen().webWidthMediaQuery(context, 1097) <= 860
              ? _row2by2Widget()
              : _row4Widget()
        ],
      ),
    );
  }

  Widget _row4Widget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _singleItemQuickStats(
          title: "Total Bookings",
          value: "28,345",
          icon: null,
        ),
        _singleItemQuickStats(
            title: "Pending Approval",
            value: "180",
            icon: null,
            textColor: Colors.red),
        _singleItemQuickStats(
            title: "New Clients This Month",
            value: "810",
            icon: Icons.arrow_upward,
            iconColor: Colors.green),
        _singleItemQuickStats(
            title: "Returning Clients",
            value: "20%",
            icon: Icons.arrow_downward,
            iconColor: Colors.red),
      ],
    );
  }

  Widget _row2by2Widget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _singleItemQuickStats(
              title: "Total Bookings",
              value: "28,345",
              width: ResponsiveScreen().webWidthMediaQuery(context, 495.5),
              icon: null,
            ),
            _singleItemQuickStats(
                title: "Pending Approval",
                value: "180",
                icon: null,
                width: ResponsiveScreen().webWidthMediaQuery(context, 495.5),
                textColor: Colors.red),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _singleItemQuickStats(
                title: "New Clients This Month",
                value: "810",
                icon: Icons.arrow_upward,
                iconColor: Colors.green,
                width: ResponsiveScreen().webWidthMediaQuery(context, 495.5)),
            _singleItemQuickStats(
                title: "Returning Clients",
                value: "20%",
                icon: Icons.arrow_downward,
                width: ResponsiveScreen().webWidthMediaQuery(context, 495.5),
                iconColor: Colors.red),
          ],
        ),
      ],
    );
  }

  Widget _singleItemQuickStats(
      {String title,
      Color textColor = Colors.black,
      String value,
      IconData icon,
      double width,
      Color iconColor}) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveScreen().webWidthMediaQuery(context, 28),
        vertical: ResponsiveScreen().webHeightMediaQuery(context, 18),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.2),
              spreadRadius: 2,
              offset: Offset(0.5, 0.5),
              blurRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: textColor, fontSize: 18),
          ),
          SizedBox(
            height: ResponsiveScreen().webHeightMediaQuery(context, 10),
          ),
          icon == null
              ? Text(
                  value,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      icon,
                      color: iconColor,
                    )
                  ],
                ),
        ],
      ),
    );
  }

  Widget _rowButtons() {
    return Container(
      height: ResponsiveScreen().webHeightMediaQuery(context, 40),
      margin: EdgeInsets.only(
        top: ResponsiveScreen().webHeightMediaQuery(context, 15),
        right: ResponsiveScreen().webWidthMediaQuery(context, 20),
        left: ResponsiveScreen().webWidthMediaQuery(context, 20),
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Colors.black.withOpacity(.2)))),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _rowCurrentBtnIndex = 0;
              });
            },
            child: _singleRowButton(
              title: "Bookings",
              textColor:
                  _rowCurrentBtnIndex == 0 ? Colors.black : Colors.grey[500],
              borderColor: _rowCurrentBtnIndex == 0
                  ? Colors.deepOrange
                  : Colors.transparent,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _rowCurrentBtnIndex = 1;
              });
            },
            child: _singleRowButton(
              title: "Enquiries",
              textColor:
                  _rowCurrentBtnIndex == 1 ? Colors.black : Colors.grey[500],
              borderColor: _rowCurrentBtnIndex == 1
                  ? Colors.deepOrange
                  : Colors.transparent,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _rowCurrentBtnIndex = 2;
              });
            },
            child: _singleRowButton(
              title: "My Service",
              textColor:
                  _rowCurrentBtnIndex == 2 ? Colors.black : Colors.grey[500],
              borderColor: _rowCurrentBtnIndex == 2
                  ? Colors.deepOrange
                  : Colors.transparent,
            ),
          ),
          Expanded(child: Container()),
          _iconsDisplay()
        ],
      ),
    );
  }

  Widget _singleRowButton({
    String title,
    Color textColor,
    Color borderColor,
  }) {
    return Container(
      height: ResponsiveScreen().webHeightMediaQuery(context, 40),
      margin: EdgeInsets.only(
          right: ResponsiveScreen().webWidthMediaQuery(context, 20)),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: ResponsiveScreen().webWidthMediaQuery(context, 2),
                  color: borderColor))),
      child: Text(
        title,
        style: TextStyle(color: textColor, fontSize: 20),
      ),
    );
  }

  Widget _iconsDisplay() {
    return Row(
      children: [
        _displayListGrid(ConstantsImages.VIEW_MODULE_DARK,
            ConstantsImages.VIEW_MODULE_LIGHT, true),
        _displayListGrid(
            ConstantsImages.LIST_LIGHT, ConstantsImages.LIST_DARK, false),
      ],
    );
  }

  Widget _displayListGrid(
      String showTrue, String showFalse, bool isDisplayGrid) {
    return Container(
      width: 40,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            child: IconButton(
              icon: WebsafeSvg.asset(_isDisplayGrid ? showTrue : showFalse),
              onPressed: () {
                setState(() {
                  _isDisplayGrid = isDisplayGrid;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _gridListItems() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: ResponsiveScreen().webWidthMediaQuery(context, 20)),
        child: GridView.builder(
          itemCount: _dataBooking.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  ResponsiveScreen().webWidthMediaQuery(context, 1097) <= 860
                      ? 2
                      : 3,
              childAspectRatio: 1.7),
          itemBuilder: (context, index) {
            return _itemGridView(context, index);
          },
        ),
      ),
    );
  }

  Widget _itemGridView(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(
        right: ResponsiveScreen().webWidthMediaQuery(context, 8),
        top: ResponsiveScreen().webHeightMediaQuery(context, 8),
        bottom: ResponsiveScreen().webHeightMediaQuery(context, 8),
        left: ResponsiveScreen().webWidthMediaQuery(context, 8),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveScreen().webWidthMediaQuery(context, 28),
        vertical: ResponsiveScreen().webHeightMediaQuery(context, 18),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 2,
            offset: Offset(0.5, 0.5),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _dataBooking[index].name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Service",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              Text(
                "Flutter Development",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  Text(
                    _dataBooking[index].date,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Time",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  Text(
                    _dataBooking[index].time,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Accept Booking",
                style: TextStyle(fontSize: 18, color: Colors.indigo),
              ),
              Text("Decline"),
            ],
          )
        ],
      ),
    );
  }

  Widget _listViewItems() {
    return Expanded(
      child: ListView.builder(
        itemCount: _dataBooking.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext ctx, int index) {
          return _itemListView(ctx, index);
        },
      ),
    );
  }

  Widget _itemListView(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(
        right: ResponsiveScreen().webWidthMediaQuery(context, 8),
        top: ResponsiveScreen().webHeightMediaQuery(context, 8),
        bottom: ResponsiveScreen().webHeightMediaQuery(context, 8),
        left: ResponsiveScreen().webWidthMediaQuery(context, 8),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveScreen().webWidthMediaQuery(context, 28),
        vertical: ResponsiveScreen().webHeightMediaQuery(context, 18),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 2,
            offset: Offset(0.5, 0.5),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _dataBooking[index].name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Service",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              Text(
                "Flutter Development",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Date",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              Text(
                _dataBooking[index].date,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Time",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              Text(
                _dataBooking[index].time,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _readFirebase() {
    _bookingSub?.cancel();
    _bookingSub = _snapshots.listen(
      (QuerySnapshot snapshot) {
        final List<DataModelFirebase> dataBooking = snapshot.documents
            .map(
              (documentSnapshot) =>
                  DataModelFirebase.fromFirebase(documentSnapshot.data),
            )
            .toList();

        setState(() {
          _dataBooking = dataBooking;
        });
      },
    );
  }
}
