// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;

/// Simple plugin to display ads from AdManager in Flutter Web
///
/// This plugin will use the GPT.js library from Google to display ads
/// using one Custom Function JS that will be injected in the DOM
/// and will be called from the Flutter Web App
///
class AdManagerWeb {
  /// Function to load the GPT.js library and add our custom function
  /// Its need to be called before the first ad is loaded
  ///
  static void init() async {
    /// Add GPT script to the page
    html.document.head?.append(
      html.ScriptElement()
        ..src = 'https://securepubads.g.doubleclick.net/tag/js/gpt.js'
        ..async = true,
    );

    // Initialize GPT and create a function that can be called to request ads
    html.document.head?.append(html.document.createDocumentFragment()
      ..append(html.ScriptElement()
        ..type = 'text/javascript'
        ..text = '''
          window.googletag = {}; googletag.cmd = googletag.cmd || []; googletag.cmd.push(() => { googletag.pubads().collapseEmptyDivs(); googletag.enableServices(); }); function adManagerPluginDisplay(div, adUnit, width, height) { var sizes = [[width, height]]; googletag.cmd.push(() => { googletag.defineSlot(adUnit, sizes, div).addService(googletag.pubads()); googletag.display(div); }); }
        '''));
  }
}
