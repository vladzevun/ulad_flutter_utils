

import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_common_utils/src/widgets/loadings/loadings.dart';

class PaginationEndLoading extends StatelessWidget {
  const PaginationEndLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(child: PrimaryLoading()),
        spacingV16,
      ],
    );
  }
}
