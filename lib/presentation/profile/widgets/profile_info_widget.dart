import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/app_bar/basic_app_bar.dart';
import '../bloc/profile_info_cubit.dart';
import '../bloc/profile_info_states.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getProfileInfo(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2.5,

        decoration: BoxDecoration(
          color: context.isDarkMode ? const Color(0xff2c2b2b) : Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45.r),
            bottomRight: Radius.circular(45.r),
          ),
        ),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoStates>(
          builder: (context, state) {
            if (state is ProfileInfoLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.isDarkMode
                      ? const Color(0xffDDDDDD)
                      : const Color(0xff414141),
                ),
              );
            }
            if (state is ProfileInfoLoadedState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BasicAppBar(
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: context.isDarkMode
                            ? const Color(0xffCFCFCF)
                            : const Color(0xff7D7D7D),
                      ),
                    ),
                  ),
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(state.userEntity.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    state.userEntity.fullName!,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: context.isDarkMode
                          ? const Color(0xffCFCFCF)
                          : const Color(0xff7D7D7D),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    state.userEntity.email!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: context.isDarkMode
                          ? const Color(0xffDDDDDD)
                          : const Color(0xff414141),
                    ),
                  ),
                ],
              );
            }
            if (state is ProfileInfoErrorState) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(color: Colors.red, fontSize: 16.sp),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
