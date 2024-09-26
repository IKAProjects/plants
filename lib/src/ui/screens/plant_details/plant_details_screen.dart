import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:plants/src/data/plant_repository.dart';
import 'package:plants/src/domain/models/plant_model.dart';
import 'package:plants/src/ui/blocs/plant_bloc/plant_bloc.dart';
import 'package:plants/src/ui/widgets/app_bottom_bar.dart';

import '../../../../gen/assets.gen.dart';
import '../../../infrastructure/resources/app_colors.dart';
import '../../../infrastructure/resources/app_styles.dart';
import '../../widgets/app_button.dart';
import '../edit_plant/edit_plant_screen.dart';

class PlantDetailsScreen extends StatefulWidget {
  const PlantDetailsScreen({super.key, required this.plantModel});

  final PlantModel plantModel;

  @override
  State<PlantDetailsScreen> createState() => _PlantDetailsScreenState();
}

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  final _blocPlant = PlantBloc(GetIt.I<PlantRepository>());
  @override
  void initState() {
    _blocPlant
        .add(LoadPlantDetailEvent(plantKey: widget.plantModel.id.toString()));
    super.initState();
  }

  Future<void> _showMenuDialog(BuildContext context, PlantModel plant) async {
    return showModalBottomSheet<void>(
      context: context,
      barrierColor: AppColors.black.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      builder: (BuildContext cont) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 112.h,
              width: 359.w,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: AppColors.blue1B2228,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        final bool? isEdited = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditPlantScreen(
                              plant: plant,
                            ),
                          ),
                        );

                        if (isEdited == true) {
                          _blocPlant
                              .add(LoadPlantDetailEvent(plantKey: widget.plantModel.id.toString()));
                        }
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF0A84FF),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Divider(
                    color: AppColors.blue08AAF1.withOpacity(0.5),
                    height: 0.5,
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppButton(
                      onPressed: () async {
                        Navigator.of(cont).pop();
                        await _showDeleteConfirmationDialog(context, plant.id!);
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFFF453A),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            AppButton(
              onPressed: () {
                Navigator.of(cont).pop();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                alignment: Alignment.center,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.blue1B2228,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: const Color(0xFF0A84FF),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlantBloc, PlantState>(
      bloc: _blocPlant,
      builder: (context, state) {
        if (state is PlantDetailState) {
          final PlantModel currentPlant = state.plantModel;

          return Scaffold(
            backgroundColor: AppColors.blue1B2228,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.blue1B2228,
              leading: Center(
                child: AppButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    Assets.svg.arrowBack,
                    fit: BoxFit.contain,
                    width: 28.w,
                    height: 28.h,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: AppButton(
                    onPressed: () {
                      _showMenuDialog(context, currentPlant);
                    },
                    child: SvgPicture.asset(
                      Assets.svg.dots,
                      fit: BoxFit.contain,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.file(
                      File(currentPlant.image!),
                      fit: BoxFit.cover,
                      height: 160.h,
                      width: 160.w,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Text(
                        'Name:  ',
                        style: AppStyles.helper1.copyWith(fontSize: 18.sp),
                      ),
                      Text(
                        currentPlant.name!,
                        style: AppStyles.helper2,
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    'Description:',
                    style: AppStyles.helper1.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    currentPlant.description!,
                    style: AppStyles.helper2,
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Text(
                        'Room temperature:  ',
                        style: AppStyles.helper1.copyWith(fontSize: 16.sp),
                      ),
                      Text(
                        '${currentPlant.temperature.toString()} °C ',
                        style: AppStyles.helper1.copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Text(
                        'Humidity:  ',
                        style: AppStyles.helper1.copyWith(fontSize: 16.sp),
                      ),
                      Text(
                        currentPlant.humidity.getHumidityType,
                        style: AppStyles.helper1.copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        if (state is PlantError) {
          return Scaffold(body: Center(child: Text('Error: ${state.message}')));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}



Future<bool> _showDeleteConfirmationDialog(
    BuildContext context, String plantId) async {
  return await showCupertinoDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoTheme(
            data: CupertinoThemeData(
              brightness: Brightness.dark,
              primaryColor: AppColors.blue08AAF1,
              textTheme: CupertinoTextThemeData(
                actionTextStyle: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF0A84FF),
                ),
                textStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            child: CupertinoAlertDialog(
              title: Text(
                'Delete plant',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              content: Text(
                'Are you sure you want to delete this plant?',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF0A84FF),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0A84FF),
                    ),
                  ),
                  onPressed: () {
                    context.read<PlantBloc>().add(DeletePlant(plantId));
                    Navigator.of(context).pop(true);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppBottomBar()),
                      (predicate) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ) ??
      false;
}
