import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/deal_entity.dart';
import 'package:intl/intl.dart';

class DealDetailsScreen extends StatelessWidget {
  final Deal deal;

  const DealDetailsScreen({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 240.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(deal.thumbnail ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black45,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 40.h,
            left: 16.w,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30.sp),
                  onPressed: () {
                final router = GoRouter.of(context);
                if (router.canPop()) {
                  router.pop();
                } else {
                  router.go('/');
                }
              },
            ),
          ),

          Positioned.fill(
            top: 180.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(0, -50.h),
                    child: 
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white24,
                              blurRadius: 20.r,
                              spreadRadius: 5.r,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.network(
                            deal.thumbnail ?? '',
                            height: 120.h,
                            width: 120.w,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.image_not_supported,
                              size: 100.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Text(
                    deal.title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 8.h),

                  Text(
                    'By 2k and Aspyr',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 12.h),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "€${deal.price.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(height: 4.h),
                      if (deal.releaseDate != null)
                      Text(
                        "on ${DateFormat('dd/MM/yyyy').format(deal.releaseDate!)}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    "Where to buy it",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                      children: [
                        _buildStoreChip(
                          "Steam",
                          "19,99€",
                          "49,99€",
                          "https://upload.wikimedia.org/wikipedia/commons/8/83/Steam_icon_logo.svg",
                        ),
                        SizedBox(width: 8.w),
                        _buildStoreChip(
                          "Epic Games",
                          "29,99€",
                          "39,99€",
                          "https://upload.wikimedia.org/wikipedia/commons/3/31/Epic_Games_logo.svg",
                        ),
                      ],
                    ),
                  SizedBox(height: 24.h),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: const Color.fromARGB(255, 255, 230, 0), size: 20.sp),
                        SizedBox(width: 8.w),
                          if (deal.rating != null && deal.rating! > 0.0) ...[
                          Text(
                            (deal.rating! / 20.0).toStringAsFixed(1),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ] else ...[
                          Text(
                            "No Reviews",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreChip(String storeName, String price, String originalPrice, String logoUrl) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 21, 21, 28),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SvgPicture.network(
              logoUrl,
              height: 30.h,
              width: 30.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.store,
                size: 22.sp,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                storeName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: const Color.fromARGB(255, 157, 255, 0),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    originalPrice,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
