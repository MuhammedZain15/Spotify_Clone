import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArtistImageWidget extends StatelessWidget {
  final String imageUrl;

  const ArtistImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
              color: context.isDarkMode
                  ? Colors.black54
                  : Colors.white,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Icon(
              Icons.play_arrow,
              color: context.isDarkMode
                  ? Colors.white
                  : Colors.black54,
              size: 24.sp,
            ),
          ),
        ),
      ),
    );
  }
}
