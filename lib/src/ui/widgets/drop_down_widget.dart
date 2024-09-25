import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../infrastructure/resources/app_colors.dart';

class Category {
  final List<Description> tasks;

  Category({required this.tasks});
}

class Description {
  final String title;
  final String description;

  Description({required this.title, required this.description});
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.categories,
    required this.click,
    this.title,
    this.hint = 'Select an option',
    this.selectedText = '',
  });

  final List<Category> categories;
  final Function(String text, String desc) click;
  final String? title;
  final String hint;
  final String selectedText;

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  int selectedTile = -1;
  late String selectedText = widget.selectedText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.categories.map((category) {
        final isExpanded = widget.categories.indexOf(category) == selectedTile;

        return Container(
          decoration: BoxDecoration(
            color: AppColors.blue1C2329,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: isExpanded
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
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTile =
                        isExpanded ? -1 : widget.categories.indexOf(category);
                  });
                },
                child: Container(
                  height: 50.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedText.isEmpty ? widget.hint : selectedText,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: selectedText.isEmpty
                              ? AppColors.gray939393
                              : AppColors.white,
                        ),
                      ),
                      SvgPicture.asset(
                        isExpanded ? Assets.svg.arrowUp : Assets.svg.arrowDown,
                        width: 24.w,
                        height: 24.h,
                        color: AppColors.blue08AAF1,
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isExpanded ? 1.0 : 0.0,
                child: const Divider(
                  color: AppColors.blue08AAF1,
                  thickness: 1.0,
                  height: 1.0,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: isExpanded ? null : 0,
                child: isExpanded
                    ? SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.blue1C2329,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.r),
                              bottomLeft: Radius.circular(16.r),
                            ),
                          ),
                          child: Column(
                            children: category.tasks.map((task) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 8.h),
                                child: GestureDetector(
                                  onTap: () {
                                    widget.click(task.title, task.description);
                                    setState(() {
                                      selectedText = task.title;
                                      selectedTile = -1;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            task.title,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      task.description.isEmpty
                                          ? const SizedBox()
                                          : SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                task.description,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.gray939393,
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
