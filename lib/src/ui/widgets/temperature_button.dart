import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../infrastructure/resources/app_colors.dart';
import 'app_button.dart';

class TemperatureButton extends StatefulWidget {
  const TemperatureButton({
    super.key,
    required this.text,
    this.onTap,
    required this.textColor,
  });

  final String text;
  final VoidCallback? onTap;
  final Color textColor;

  @override
  _TemperatureButtonState createState() => _TemperatureButtonState();
}

class _TemperatureButtonState extends State<TemperatureButton> {
  bool _isFocused = false;

  void _onFocusChange(bool hasFocus) {
    setState(() {
      _isFocused = hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onFocusChange(true), // Detect tap down event
      onTapCancel: () => _onFocusChange(false), // Reset focus when tap is canceled
      onTapUp: (_) {
        _onFocusChange(false);
        if (widget.onTap != null) {
          widget.onTap!(); // Call the onTap if provided
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.centerLeft,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.blue1C2329,
          boxShadow: _isFocused
              ? [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 0,
              offset: const Offset(0, 4),
              color: AppColors.blue08AAF1,
            ),
          ]
              : [BoxShadow(
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 4),
            color: Colors.white.withOpacity(0.5),
          ),],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: widget.textColor,
              ),
            ),
            SvgPicture.asset(
              Assets.svg.arrowRight,
              fit: BoxFit.contain,
              width: 24.w,
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}