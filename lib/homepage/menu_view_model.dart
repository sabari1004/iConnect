import 'package:flutter/material.dart';
import 'package:flutteruiapp/homepage/menu.dart';
import 'package:flutteruiapp/util/uidata.dart';

class MenuViewModel {
  List<Menu> menuItems;

  MenuViewModel({this.menuItems});

  getMenuItems() {
    return menuItems = <Menu>[
      Menu(
          title: "Pay Details",
          menuColor: Color(0xffc8c4bd),
          icon: Icons.monetization_on,
          image: UIData.shoppingImage,
          items: [
            "View Payslip",
            "Pay Summary",
            "Tax Form",
          ]),
      Menu(
          title: "Leave/Attendance",
          menuColor: Color(0xffc7d8f4),
          icon: Icons.airline_seat_individual_suite,
          image: UIData.loginImage,
          items: [
            "Leave Balance",
            "Over Time Details",
            "Apply Leave",
            "Get Encashment Details",
            "Apply Encashment"
          ]),
      Menu(
          title: "Reimbursement",
          menuColor: Color(0xff7f5741),
          icon: Icons.assignment,
          image: UIData.timelineImage,
          items: ["Get Reimbursement Details", "Submit Reimbursement"]),
      Menu(
          title: "Dashboard",
          menuColor: Color(0xff261d33),
          icon: Icons.dashboard,
          image: UIData.dashboardImage,
          items: ["KPI Report", "Sales Report", "Productivity Report"]),
      Menu(
          title: "Profile",
          menuColor: Color(0xff050505),
          icon: Icons.person,
          image: UIData.profileImage,
          items: ["View Profile"]),
      Menu(
          title: "Settings",
          menuColor: Color(0xff2a8ccf),
          icon: Icons.settings,
          image: UIData.settingsImage,
          items: ["Device Settings"]),
    ];
  }
}
