import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorWithRetry extends StatelessWidget {
  final String message;
  final int currentPage;
  final int pageSize;

  const ErrorWithRetry({
    super.key,
    required this.message,
    required this.currentPage,
    required this.pageSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              context.read<DealsBloc>().add(
                LoadDealsEvent(page: currentPage, pageSize: pageSize),
              );
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
