import 'package:flutter/material.dart';
import "package:universal_html/html.dart";
import 'package:universal_html/js.dart' as js;
import 'package:visibility_detector/visibility_detector.dart';
import 'dart:ui' as ui;

import 'adblocksize.dart';

/// Widget that displays an Ad from AdManager
class AdBlock extends StatefulWidget {
  final List<AdBlockSize> size;

  /// The ad unit code from AdManager Panel
  /// Example: /1234567/my-ad (where 1234567 is the network code and my-ad is the ad unit code)
  final String? adUnitId;

  const AdBlock({super.key, required this.size, required this.adUnitId});

  @override
  State<AdBlock> createState() => _AdBlockState();
}

class _AdBlockState extends State<AdBlock> {
  String blockId = "";
  double? width;
  double? height;
  bool isEmpty = false;
  bool hasLoaded = false;

  @override
  void initState() {
    super.initState();

    String counter = window.localStorage['GAM_counter'] ?? '0';
    window.localStorage['GAM_counter'] = (int.parse(counter) + 1).toString();
    blockId = "ad_$counter";

    // Listen to messages from the page
    window.addEventListener('gam_slot_render', _renderListener);

    _createView();
  }

  void _createView() {
    ui.platformViewRegistry.registerViewFactory("gam_$blockId", (int viewId) {
      var div = DivElement()..id = blockId;

      div.style.width = "${widget.size[0].width}px";
      div.style.height = "${widget.size[0].height}px";

      return div;
    });
  }

  void _loadAd() {
    List<String> sizes =
        widget.size.map((e) => "${e.width}x${e.height}").toList();

    js.context.callMethod(
      'adManagerPluginDisplay',
      [blockId, widget.adUnitId, sizes.join("|")],
    );

    hasLoaded = true;
  }

  _renderListener(Event event) {
    if (event is CustomEvent) {
      var detail = event.detail;

      if (detail['blockId'] == blockId) {
        setState(() {
          isEmpty = detail['isEmpty'];
          if (!isEmpty) {
            width = detail['size'][0];
            height = detail['size'][1];
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmpty && hasLoaded
        ? const SizedBox.shrink()
        : VisibilityDetector(
            key: Key(blockId),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction > 0 && !hasLoaded) {
                _loadAd();
              }
            },
            child: SizedBox(
              height: height ?? widget.size[0].height.toDouble(),
              width: width ?? widget.size[0].width.toDouble(),
              child: HtmlElementView(
                viewType: "gam_$blockId",
                onPlatformViewCreated: (id) {},
              ),
            ),
          );
  }
}
