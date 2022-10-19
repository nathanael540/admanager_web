// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;
import 'dart:js' as js;

import 'adblocksize.dart';

/// A widget that displays an Ad from AdManager in a Flutter Web app
///
/// This widget will create one [SizedBox] with the size of the ad and will
/// display the ad inside it using the GPT.js library from Google
///
class AdBlock extends StatelessWidget {
  /// The size that will be used to request the ad
  final AdBlockSize size;

  /// The ad unit code from AdManager Panel
  final String? adUnitId;

  /// Custom Random Id for our div that will load the ad
  final String blockId = "ad_${Random().nextInt(999999).toRadixString(36)}";

  /// The constructor for our widget
  AdBlock({super.key, required this.size, required this.adUnitId}) {
    /// We create a DivElement to hold our ad ;)
    ui.platformViewRegistry.registerViewFactory("admanager_$blockId",
        (int viewId) {
      var div = html.DivElement()..id = blockId;

      // TODO: Allow more sizes, like responsive ads ["fluid"]

      div.style.width = "${size.width}px";
      div.style.height = "${size.height}px";

      // TODO: Add a eventListener to check if the ad was loaded

      return div;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// We create a SizedBox with the size of the ad
    return SizedBox(
      height: size.height.toDouble(),
      width: size.width.toDouble(),
      child: HtmlElementView(
        viewType: "admanager_$blockId",
        onPlatformViewCreated: (id) {
          /// Its call our function to load the ad from AdManager using GPT.js
          js.context.callMethod('adManagerPluginDisplay', [
            blockId,
            adUnitId,
            size.width,
            size.height,
          ]);
        },
      ),
    );
  }
}
