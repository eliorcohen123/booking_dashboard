import 'package:booking_management_dashboard/utils/responsive_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: ResponsiveScreen().webWidthMediaQuery(context, 384),
      height: ResponsiveScreen().webHeightMediaQuery(context, 900),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 2,
            offset: Offset(0.5, 0.0),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Wrap(
        children: [
          _searchWidget(context),
          _profileWidget(context),
          _upgradeToProWidget(context),
          _reminderWidget(context),
        ],
      ),
    );
  }

  Widget _searchWidget(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: ResponsiveScreen().webWidthMediaQuery(context, 220),
            height: ResponsiveScreen().webHeightMediaQuery(context, 40),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ResponsiveScreen().webHeightMediaQuery(context, 50)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: ResponsiveScreen().webWidthMediaQuery(context, 190),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height:
                          ResponsiveScreen().webHeightMediaQuery(context, 5),
                    ),
                    Text(
                      "Amir Khan!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height:
                          ResponsiveScreen().webHeightMediaQuery(context, 5),
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text.",
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 80,
                child: Image.asset("assets/profile.png"),
              )
            ],
          ),
          SizedBox(
            height: ResponsiveScreen().webHeightMediaQuery(context, 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: ResponsiveScreen().webWidthMediaQuery(context, 190),
                height: ResponsiveScreen().webHeightMediaQuery(context, 35),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Url",
                    hintStyle: TextStyle(fontSize: 16),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.copy,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Container(
                height: ResponsiveScreen().webHeightMediaQuery(context, 35),
                padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveScreen().webWidthMediaQuery(context, 10)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Text(
                  "Edit Link",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _upgradeToProWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ResponsiveScreen().webHeightMediaQuery(context, 40)),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveScreen().webWidthMediaQuery(context, 12),
        vertical: ResponsiveScreen().webHeightMediaQuery(context, 20),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: Colors.indigo),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upgrade\nto PRO",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "For more Profile Control",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 50,
            child: Image.asset("assets/pro.png"),
          )
        ],
      ),
    );
  }

  Widget _reminderWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ResponsiveScreen().webHeightMediaQuery(context, 20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reminders",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.orange),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.orange,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: ResponsiveScreen().webHeightMediaQuery(context, 15),
          ),
          _singleRowButton(
              title: "Booking Reminder",
              description: "Lorem Ipsum is simply dummy text",
              icon: Icons.announcement_outlined,
              iconColor: Colors.red[600],
              boxColor: Colors.red[100],
              context: context),
          SizedBox(height: ResponsiveScreen().webHeightMediaQuery(context, 15)),
          _singleRowButton(
              title: "New Message",
              description: "Lorem Ipsum is simply dummy text",
              icon: Icons.announcement_outlined,
              iconColor: Colors.yellow[600],
              boxColor: Colors.yellow[100],
              context: context),
          SizedBox(
            height: ResponsiveScreen().webHeightMediaQuery(context, 15),
          ),
          _singleRowButton(
              title: "Upcoming Booking",
              description: "Lorem Ipsum is simply dummy text",
              icon: Icons.announcement_outlined,
              iconColor: Colors.red[600],
              boxColor: Colors.red[100],
              context: context),
        ],
      ),
    );
  }

  _singleRowButton(
      {Color boxColor,
      Color iconColor,
      IconData icon,
      String title,
      String description,
      BuildContext context}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveScreen().webWidthMediaQuery(context, 5),
              vertical: ResponsiveScreen().webHeightMediaQuery(context, 5)),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
        ),
        SizedBox(
          width: ResponsiveScreen().webHeightMediaQuery(context, 10),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[400]),
            )
          ],
        )
      ],
    );
  }
}
