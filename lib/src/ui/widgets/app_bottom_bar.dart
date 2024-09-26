import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants/src/infrastructure/resources/app_styles.dart';
import 'package:plants/src/ui/screens/facts/facts_screen.dart';
import 'package:plants/src/ui/screens/tips/tips_screen.dart';

import '../../../gen/assets.gen.dart';
import '../../infrastructure/resources/app_colors.dart';
import '../screens/add_plant/add_plant_screen.dart';
import '../screens/main/main_screen.dart';
import '../screens/settings/settings_screen.dart';
import 'app_button.dart';

class AppBottomBarState extends State<AppBottomBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.indexScr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            child: Container(
              height: 110.h,
              decoration: BoxDecoration(
                color: AppColors.blue1C2329.withOpacity(0.95),


              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: buildNavItem(0, Assets.svg.home, 'Main'),
                      ),
                      Expanded(
                        child: buildNavItem(1, Assets.svg.facts, 'Facts'),
                      ),
                      SizedBox(width: 60.w),
                      Expanded(
                        child: buildNavItem(2, Assets.svg.tips, 'Tips'),
                      ),
                      Expanded(
                        child: buildNavItem(3, Assets.svg.settings, 'Settings'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -50.h,
            left: MediaQuery.of(context).size.width / 2 - 50.w,
            child: AppButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPlantScreen(),
                  ),
                );
              },
              child: SvgPicture.asset(
                Assets.svg.bottomIcon,
                fit: BoxFit.contain,
                width: 100.w,
                height: 100.h,

              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(int index, String iconPath, String name) {
    bool isActive = _currentIndex == index;

    return AppButton(
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24.w,
            height: 24.h,
            color: isActive ? AppColors.blue08AAF1 : AppColors.white,
          ),
          Text(
            name,
            style: AppStyles.helper4.copyWith(
                color: isActive ? AppColors.blue08AAF1 : AppColors.white),
          ),
        ],
      ),
    );
  }

  final _pages = <Widget>[
    const MainScreen(),
    const FactsScreen(),
    const TipsScreen(),
    const SettingsScreen(),
  ];
}

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key, this.indexScr = 0});

  final int indexScr;

  @override
  State<AppBottomBar> createState() => AppBottomBarState();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppBottomBar(),
    );
  }
}
