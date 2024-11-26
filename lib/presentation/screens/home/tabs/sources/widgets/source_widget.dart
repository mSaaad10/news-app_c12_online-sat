import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sat/config/theme/app_styles.dart';
import 'package:news_app_c12_online_sat/core/colors_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/sources_response/source.dart';

class SourceWidget extends StatelessWidget {
  SourceWidget({super.key, required this.source, required this.isSelected});

  Source source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: REdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
          color: isSelected ? ColorsManager.green : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: ColorsManager.green, width: 2)),
      child: Text(
        source.name ?? '',
        style: isSelected ? AppStyles.selectedLabel : AppStyles.unSelectedLabel,
      ),
    );
  }
}
