import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';

class BottomLoadingWidget extends StatelessWidget {
  const BottomLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(children: const [
      SizedBox(height: 32),
      Center(child: CircularProgressIndicator(color: appMainColor)),
      SizedBox(height: 32),
    ]));
  }
}
