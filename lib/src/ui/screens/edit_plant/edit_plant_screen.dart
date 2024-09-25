import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plants/src/infrastructure/resources/app_colors.dart';
import 'package:plants/src/ui/blocs/plant_bloc/plant_bloc.dart';

import '../../../../gen/assets.gen.dart';
import '../../../domain/models/plant_model.dart';
import '../../../infrastructure/resources/app_styles.dart';
import '../../widgets/app_button.dart';
import '../../widgets/drop_down_widget.dart';
import '../../widgets/temperature_button.dart';
import '../../widgets/text_field_widget.dart';

class EditPlantScreen extends StatefulWidget {
  final PlantModel plant;

  const EditPlantScreen({super.key, required this.plant});

  @override
  _EditPlantScreenState createState() => _EditPlantScreenState();
}

class _EditPlantScreenState extends State<EditPlantScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  bool _isImageAdded = false;
  int? _selectedTemperature;
  final _plantNameController = TextEditingController();
  final _plantDescriptionController = TextEditingController();

  PlantHumidity? plantHumidity;
  String titleHumidityType = '';

  @override
  void initState() {
    super.initState();
    _plantNameController.text = widget.plant.name ?? '';
    _plantDescriptionController.text = widget.plant.description ?? '';
    _image = widget.plant.image != null ? File(widget.plant.image!) : null;
    _isImageAdded = _image != null;
    _selectedTemperature = widget.plant.temperature;
    plantHumidity = widget.plant.humidity;

    titleHumidityType = plantHumidity?.getHumidityType ?? '';
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
          _isImageAdded = true;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  List<Category> humidityTypeList = [
    Category(
      tasks: [
        Description(
          title: PlantHumidity.high.getHumidityType,
          description: PlantHumidity.highDescr.getHumidityType,
        ),
        Description(
          title: PlantHumidity.medium.getHumidityType,
          description: PlantHumidity.mediumDescr.getHumidityType,
        ),
        Description(
          title: PlantHumidity.low.getHumidityType,
          description: PlantHumidity.lowDescr.getHumidityType,
        ),
      ],
    )
  ];

  PlantHumidity checkHumidity(String type) {
    switch (type) {
      case 'High humidity':
        return PlantHumidity.high;
      case 'Medium humidity':
        return PlantHumidity.medium;
      case 'Low humidity':
        return PlantHumidity.low;
      default:
        return PlantHumidity.medium;
    }
  }

  final List<int> _temperatures = List.generate(61, (index) => index - 20);

  bool get isFilled =>
      _plantNameController.text.isNotEmpty &&
          _plantDescriptionController.text.isNotEmpty &&
          _selectedTemperature != null &&
          plantHumidity != null;

  @override
  Widget build(BuildContext context) {
    String displayText = _selectedTemperature != null ? '$_selectedTemperature °C ' : '25 °C';
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
        title: Text(
          'Edit',
          style: AppStyles.helper1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'Add a photo',
                style: AppStyles.helper4,
              ),
              SizedBox(height: 4.h),
              AppButton(
                onPressed: _pickImage,
                child: Container(
                  alignment: Alignment.center,
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.blue1C2329,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: _image != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.file(
                      _image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.svg.plus,
                        fit: BoxFit.contain,
                        width: 28.w,
                        height: 28.h,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Add',
                        style: AppStyles.helper3,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              AppButton(
                onPressed: () {
                  if (_isImageAdded) {
                    setState(() {
                      _image = null;
                      _isImageAdded = false;
                    });
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: !_isImageAdded ? AppColors.blue4D6C89 : AppColors.redFF0000,
                      ),
                      child: Text(
                        'Delete',
                        style: AppStyles.helper4.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: _isImageAdded ? Colors.transparent : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Plant name',
                style: AppStyles.helper4,
              ),
              SizedBox(height: 8.h),
              TextFieldWidget(
                hint: 'Cactus',
                onChanged: (value) {
                  setState(() {});
                },
                controller: _plantNameController,
              ),
              SizedBox(height: 16.h),
              Text(
                'Description',
                style: AppStyles.helper4,
              ),
              SizedBox(height: 8.h),
              TextFieldWidget(
                hint: 'Cactus on the windowsill in the kitchen',
                onChanged: (value) {
                  setState(() {});
                },
                controller: _plantDescriptionController,
              ),
              SizedBox(height: 16.h),
              Text(
                'Room Temperature',
                style: AppStyles.helper4,
              ),
              SizedBox(height: 8.h),
              TemperatureButton(
                text: displayText,
                onTap: () {
                  showTemperaturePickerDialog(context);
                },
                textColor: _selectedTemperature != null ? Colors.white : AppColors.gray939393,
              ),
              SizedBox(height: 16.h),
              Text(
                'Humidity',
                style: AppStyles.helper4,
              ),
              SizedBox(height: 8.h),
              DropDownWidget(
                selectedText: titleHumidityType,
                title: titleHumidityType,
                categories: humidityTypeList,
                click: (title, desc) {
                  setState(() {});
                  plantHumidity = PlantHumidity.values
                      .where(
                        (element) => element.getHumidityType == title,
                  )
                      .firstOrNull;
                  titleHumidityType = title;
                },
                hint: titleHumidityType,
              ),
              SizedBox(height: 150.h),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppButton(
        onPressed: () {
          if (isFilled) {
            final updatedPlant = PlantModel(
              name: _plantNameController.text,
              description: _plantDescriptionController.text,
              image: _image?.path,
              temperature: _selectedTemperature ?? 20,
              humidity: checkHumidity(titleHumidityType),
              id: widget.plant.id, isFavorite: false,
            );

            context.read<PlantBloc>().add(UpdatePlant(updatedPlant));

            Navigator.pop(context, true);
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: 64.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.blue08AAF1,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            'Save',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: isFilled ? Colors.white : const Color(0xFF6B6B6B),
            ),
          ),
        ),
      ),
    );
  }

  void showTemperaturePickerDialog(BuildContext context) {
    if (_selectedTemperature == null && _temperatures.isNotEmpty) {
      _selectedTemperature = _temperatures[20];
    }
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            color: AppColors.blue1C2329,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blue007AFF,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blue007AFF,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                const Divider(
                  color: AppColors.white,
                ),
                SizedBox(
                  height: 200.h,
                  child: CupertinoPicker(
                    itemExtent: 40.0,
                    scrollController: FixedExtentScrollController(
                      initialItem: _temperatures
                          .indexOf(_selectedTemperature ?? _temperatures[0]),
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedTemperature = _temperatures[index];
                      });
                    },
                    children: _temperatures
                        .map(
                          (temp) => Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: Text(
                            '$temp °C',
                            style: TextStyle(
                              fontSize: 23.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
