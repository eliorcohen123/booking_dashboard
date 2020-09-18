import 'package:booking_management_dashboard/screen/pages/web/widgets/right_side_widget.dart';
import 'package:booking_management_dashboard/screen/pages/web/widgets/web_vertical_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/body_content_widget.dart';

class DesktopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, sizingInformation) {
        return Scaffold(
          body: Container(
            child: Row(
              children: [
                WebVerticalNavWidget(),
                BodyContentWidget(),
                RightSideWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
