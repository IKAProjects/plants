import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants/src/infrastructure/resources/app_styles.dart';
import '../../infrastructure/resources/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final ValueChanged<String>? onChanged;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    this.onChanged,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        // Apply shadow only when focused
        boxShadow: _isFocused
            ? [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                  color: AppColors.blue08AAF1,
                ),
              ]
            : [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                  color: Colors.white.withOpacity(0.5),
                ),
              ],
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        cursorColor: AppColors.white,
        style: AppStyles.helper2,
        decoration: InputDecoration(
          fillColor: AppColors.blue1C2329,
          filled: true,
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.gray939393,
          ),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
        ),
        maxLines: 1,
      ),
    );
  }
}
