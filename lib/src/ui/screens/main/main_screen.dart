import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:plants/di.dart';
import 'package:plants/src/infrastructure/resources/app_styles.dart';
import 'package:plants/src/ui/screens/add_plant/add_plant_screen.dart';
import 'package:plants/src/ui/screens/plant_details/plant_details_screen.dart';

import '../../../../gen/assets.gen.dart';
import '../../../domain/models/plant_model.dart';
import '../../../infrastructure/resources/app_colors.dart';
import '../../blocs/plant_bloc/plant_bloc.dart';
import '../../widgets/app_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isFavoritesSelected = false;

  @override
  void initState() {
    super.initState();
    context.read<PlantBloc>().add(LoadPlants());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue1B2228,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  onPressed: () {
                    setState(() {
                      isFavoritesSelected = false;
                    });
                  },
                  child: Text(
                    'Plants',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: !isFavoritesSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                AppButton(
                  onPressed: () {
                    setState(() {
                      isFavoritesSelected = true;
                    });
                  },
                  child: Text(
                    'Favorites',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: isFavoritesSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Expanded(
              child: BlocBuilder<PlantBloc, PlantState>(
                builder: (context, state) {
                  if (state is PlantLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PlantLoaded) {
                    final plants = isFavoritesSelected
                        ? state.plants
                            .where((plant) => plant.isFavorite)
                            .toList()
                        : state.plants;

                    return plants.isEmpty
                        ? Column(
                            children: [
                              SizedBox(height: 60.h),
                              Assets.png.emptyBox.image(
                                fit: BoxFit.contain,
                                width: 250.w,
                                height: 250.h,
                              ),
                              SizedBox(height: 35.h),
                              Text(
                                isFavoritesSelected
                                    ? "No favorites yet."
                                    : "While it's empty, create plant cards",
                                style: AppStyles.helper4.copyWith(
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          )
                        : GridView.builder(
                            itemCount: plants.length,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 50.h,
                              crossAxisSpacing: 10.w,
                              childAspectRatio: 160.w / 210.h,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final plant = plants[index];
                              return AppButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlantDetailsScreen(
                                        plantModel: plant,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 160.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    color: AppColors.blue1B2228,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Colors.white.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                         borderRadius: BorderRadius.circular(16.r),
                                        child: Image.file(
                                          File(plant.image!),
                                          fit: BoxFit.cover,
                                          height: 160.h,
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 80.w,
                                              child: Text(
                                                plant.name!,
                                                style: AppStyles.helper1
                                                    .copyWith(fontSize: 18.sp),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            AppButton(
                                              onPressed: () {
                                                setState(() {
                                                  plant.isFavorite =
                                                      !plant.isFavorite;

                                                  final dataBox =
                                                      getIt<Box<PlantModel>>();

                                                  dataBox.put(plant.id, plant);
                                                });
                                              },
                                              child: plant.isFavorite
                                                  ? SvgPicture.asset(
                                                      Assets.svg.heartFilled,
                                                      fit: BoxFit.contain,
                                                      width: 28.w,
                                                      height: 28.h,
                                                    )
                                                  : SvgPicture.asset(
                                                      Assets.svg.heart,
                                                      fit: BoxFit.contain,
                                                      width: 28.w,
                                                      height: 28.h,
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                  } else if (state is PlantError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return Center(child: Text('No plants available.'));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
