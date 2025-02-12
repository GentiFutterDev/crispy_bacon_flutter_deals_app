import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/price_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceFilterDialog extends StatefulWidget {
  final PriceRange priceRange;
  final Function(double min, double max) onApply;

  const PriceFilterDialog({
    super.key,
    required this.priceRange,
    required this.onApply,
  });

  @override
  PriceFilterDialogState createState() => PriceFilterDialogState();
}

class PriceFilterDialogState extends State<PriceFilterDialog> {
  late SfRangeValues _priceRange;

  @override
  void initState() {
    super.initState();
    _priceRange = SfRangeValues(
      widget.priceRange.minPrice,
      widget.priceRange.maxPrice,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select Price Range',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 40.h),
          SfRangeSlider(
            min: 0,
            max: 30,
            values: _priceRange,
            interval: 5,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            stepSize: 5,
            onChanged: (SfRangeValues values) {
              setState(() {
                _priceRange = SfRangeValues(
                  values.start.roundToDouble(),
                  values.end.roundToDouble(),
                );
              });
            },
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Min: €${_priceRange.start.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                'Max: €${_priceRange.end.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onApply(
                _priceRange.start,
                _priceRange.end,
              );
              context.go('/');
            },
            child: const Text('Show Results'),
          ),
        ],
      ),
    );
  }
}
