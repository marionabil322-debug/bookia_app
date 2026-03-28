import 'package:bookia/core/helper/extensions.dart';
import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widegs/app_bottom.dart';
import 'package:bookia/core/widegs/custom_image_network.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItam extends StatelessWidget {
  final Product? book;
  final void Function()? onTap;
  const BookItam({super.key, this.book, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productDetailsScreen,
          arguments: book?.id,
        );
      },
      child: Container(
        padding: EdgeInsets.all(11.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColor.bookBackGround,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CustomImageNetwork(
                url: book?.image ?? "",
                height: 175.h,
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Text(
                book?.name ?? '',
                style: AppTextStyle.text18Regulars,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    book?.price ?? '',
                    style: AppTextStyle.text15Regulars.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      'Buy',
                      style: AppTextStyle.text20Regulars.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
