import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants/src/ui/widgets/app_button.dart';

import '../../../infrastructure/resources/app_colors.dart';
import '../../../infrastructure/resources/app_styles.dart';
import '../../../infrastructure/utils/box_assets.dart';
import '../../widgets/app_bottom_bar.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              itemCount: boxAssets.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        boxAssets[i].asset,
                        fit: BoxFit.cover,
                        height: 432.h,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(

                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 24.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16.r),
                            topLeft: Radius.circular(16.r),
                          ),
                          color: AppColors.blue242A54.withOpacity(0.7),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              boxAssets[i].text1,
                              style: AppStyles.helper1.copyWith(fontSize: 22.sp),
                              maxLines: 1,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              boxAssets[i].text2,
                              style: AppStyles.helper2.copyWith(fontSize: 14.sp),
                              textAlign: TextAlign.center,
                              maxLines: 6,
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              children: [
                                AppButton(
                                  onPressed: _skipToMainScreen,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60.h,
                                    width: 146.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color: Colors.transparent,
                                    ),
                                    child: Text(
                                      'Skip',
                                      style: AppStyles.helper1.copyWith(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                AppButton(
                                  onPressed: _nextPage,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60.h,
                                    width: 146.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color: AppColors.blue08AAF1,
                                    ),
                                    child: Text(
                                      'Continue',
                                      style: AppStyles.helper1
                                          .copyWith(fontSize: 20.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _nextPage() {
    if (currentIndex < boxAssets.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _navigateToMainScreen();
    }
  }

  void _skipToMainScreen() {
    _navigateToMainScreen();
  }

  void _navigateToMainScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AppBottomBar(),
      ),
    );
  }
}
