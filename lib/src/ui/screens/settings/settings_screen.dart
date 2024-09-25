import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants/src/infrastructure/resources/app_colors.dart';
import 'package:plants/src/infrastructure/resources/app_styles.dart';
import 'package:plants/src/ui/widgets/app_button.dart';

import '../../../../gen/assets.gen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue1B2228,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              _buildButton(
                onTap: () {},
                name: 'Privacy Policy',
              ),
              SizedBox(height: 24.h),
              _buildButton(
                onTap: () {},
                name: 'Terms of Use',
              ),
              SizedBox(height: 24.h),
              _buildButton(
                onTap: () {},
                name: 'Support',
              ),
              SizedBox(height: 24.h),
              _buildButton(
                onTap: () {},
                name: 'Share',
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({required String name, required VoidCallback onTap}) {
    return AppButton(
      onPressed: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.center,
        height: 64.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.blue1B2228,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.white.withOpacity(0.5),
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppStyles.helper2,
            ),
            SvgPicture.asset(
              Assets.svg.arrowRight,
              fit: BoxFit.contain,
              width: 24.w,
              height: 24.h,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
