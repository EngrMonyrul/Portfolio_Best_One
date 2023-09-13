import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../control/providers/apps_handler_provider.dart';
import '../../control/widgets/appbar_widget.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          buildAppBar(screenSize, context),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
          buildBodyContent(screenSize),
        ],
      ),
    );
  }

  Container buildBodyContent(Size screenSize) {
    final appHandler = Provider.of<AppsHandlerProvider>(context);
    return Container(
      alignment: Alignment.center,
      height: screenSize.height * 0.93,
      width: screenSize.width,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: const [
          BoxShadow(
              color: Colors.black,
              spreadRadius: 1,
              blurRadius: 30,
              offset: Offset(5, 5)),
        ],
      ),
      child: Row(
        children: [
          if (appHandler.showDrawer)
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    buildDrawerItems(CupertinoIcons.home, Colors.black,
                        screenSize.height * 0.03, 'Home', 17, Colors.black, (){}),
                        buildDrawerItems(CupertinoIcons.circle_grid_hex, Colors.black,
                        screenSize.height * 0.03, 'Projects', 17, Colors.black, (){}),
                  ],
                ),
              ),
            ),
          Expanded(
            flex: 8,
            child: Container(color: Colors.green),
          )
        ],
      ),
    );
  }

  GestureDetector buildDrawerItems(itemIcon, itemIconColor, itemIconSize,
      itemText, itemTextSize, itemTextColor, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            itemIcon,
            color: itemIconColor,
            size: itemIconSize,
          ),
          const SizedBox(width: 5),
          Text(
            itemText,
            style: TextStyle(
              fontSize: itemTextSize,
              color: itemIconColor,
              fontFamily: 'playfair',
            ),
          ),
        ],
      ),
    );
  }
}
