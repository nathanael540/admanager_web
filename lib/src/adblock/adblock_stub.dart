import 'package:admanager_web/admanager_web.dart' show AdBlockSize;
import 'package:flutter/widgets.dart' show BuildContext, SizedBox, StatelessWidget, Widget;

class AdBlock extends StatelessWidget {
  final List<AdBlockSize> size;

  final String? adUnitId;

  const AdBlock({super.key, required this.size, required this.adUnitId});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
