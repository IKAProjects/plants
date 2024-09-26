import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants/src/infrastructure/resources/app_colors.dart';
import 'package:plants/src/ui/screens/fact_details/fact_details_screen.dart';

import '../../../infrastructure/resources/app_styles.dart';
import '../../../infrastructure/utils/fact_data.dart';
import '../../widgets/app_button.dart';

class FactsScreen extends StatelessWidget {
  const FactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue1B2228,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 34.h),
                itemBuilder: (BuildContext context, int index) {
                  final fact = factData[index];
                  return AppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FactDetailsScreen(factModel: fact,),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.blue1B2228,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.white.withOpacity(0.5),
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              fact.details[2].image,
                              fit: BoxFit.cover,
                              height: 200.h,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            child: Text(
                              fact.name,
                              style:
                                  AppStyles.helper1.copyWith(fontSize: 18.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 16.h),
                itemCount: factData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
