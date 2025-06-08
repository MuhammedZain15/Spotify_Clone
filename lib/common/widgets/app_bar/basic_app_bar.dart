import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool hideBackButton;

  const BasicAppBar({
    super.key,
    this.title,
    this.actions,
    this.hideBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 15.h),
      child: SizedBox(
        height: 90.h,
        child: AppBar(

          actionsPadding: EdgeInsets.only(right: 15.w),
          actions: actions,
          actionsIconTheme: IconThemeData(
            color: context.isDarkMode
                ? const Color(0xffCFCFCF)
                : const Color(0xff7D7D7D),
            size: 26.sp,
          ),
          centerTitle: true,
          title: title ?? const Text(""),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: hideBackButton
              ? null
              : IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: context.isDarkMode
                          ? const Color(0xff2C2C2C).withOpacity(0.3)
                          : const Color(0xffe8e8e8).withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: context.isDarkMode
                          ? const Color(0xffDDDDDD)
                          : const Color(0xff414141),
                      size: 15,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.h); // Match the new height
}
