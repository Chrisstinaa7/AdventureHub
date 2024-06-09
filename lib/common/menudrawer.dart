import 'package:flutter/material.dart';
import 'package:adventurehub/screens/Budget.dart';
import 'package:adventurehub/screens/homescreen.dart';
import 'package:adventurehub/screens/Explore.dart';
import 'package:adventurehub/screens/Favourite.dart';
import 'package:adventurehub/screens/About.dart';
import 'package:adventurehub/screens/plansscreen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 167, 165, 86),
              Color.fromARGB(255, 182, 180, 93),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: buildMenuItems(context),
        ),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final Map<String, IconData> menuData = {
      "Home": Icons.home,
      "Explore": Icons.explore,
      "Favourites": Icons.favorite,
      "My Plans": Icons.calendar_today,
      "Budget": Icons.attach_money,
      "About": Icons.info,
    };

    List<Widget> menuItems = [];
    menuItems.add(
      DrawerHeader(
        child: Text(
          "Discover",
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 82, 68, 14),
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
      ),
    );

    menuData.forEach((title, icon) {
      menuItems.addAll([
        ListTile(
          leading: Icon(
            icon,
            color: Color.fromARGB(255, 82, 68, 14),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 82, 68, 14),
            ),
          ),
          onTap: () {
            Widget screen = Container();
            switch (title) {
              case "Home":
                screen = HomeScreen();
                break;
              case "Explore":
                screen = Explore();
                break;
              case "Favourites":
                screen = FavoritesScreen();
                break;
              case "About":
                screen = AboutPage();
                break;
              case "Budget":
                screen = TripBudgetScreen();
                break;
              case "My Plans":
                screen = PlansScreen();
                break;
              default:
            }

            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          },
        ),
        Divider(
          color: Color.fromARGB(255, 133, 109, 17),
          thickness: 0.5,
          indent: 20,
          endIndent: 20,
        ),
      ]);
    });

    return menuItems;
  }
}
