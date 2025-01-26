import 'package:flutter/material.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/deal_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DealCard extends StatelessWidget {
  final Deal deal;

  const DealCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 100.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deal.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 8.h),
                        Row(
                        children: List.generate(5, (starIndex) {
                          final filledStars = ((deal.rating ?? 0) / 20).ceil();
                          return Icon(
                            starIndex < filledStars ? Icons.star : Icons.star_border,
                            color: const Color.fromARGB(255, 255, 230, 0),
                            size: 16.sp,
                          );
                        }),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "\$${deal.price.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.all(4.w),
                  child: const Icon(
                    Icons.thumb_up,
                    color: Color.fromARGB(255, 255, 230, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 8.h,
          left: 8.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(
              deal.thumbnail ?? '',
              height: 110.h,
              width: 110.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.image_not_supported,
                size: 80.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
