import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants/src/infrastructure/resources/app_colors.dart';

import '../../../../gen/assets.gen.dart';
import '../onboarding/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({
    super.key,
  });

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Onboarding(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue1B2228,
      body: Center(
        child: Image.asset(
          Assets.png.logo.path,
          fit: BoxFit.contain,
          width: 200.w,
          height: 300.h,
        ),
      ),
    );
  }
}
