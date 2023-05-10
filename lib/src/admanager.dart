import "package:universal_html/html.dart";

/// Simple plugin to display ads from AdManager in Flutter Web
///
/// This plugin will use the GPT.js library from Google to display ads
/// using one Custom Function JS that will be injected in the DOM
class AdManagerWeb {
  static void init() {
    document.head?.append(document.createDocumentFragment()
      ..append(ScriptElement()
        ..type = 'text/javascript'
        ..text = '''
         function adManagerPluginDisplay(div, adUnit, sizes) { sizes = sizes.split("|").map((size) => { return size.split("x").map(function (x) { return parseInt(x, 10); }); });  googletag.cmd.push(() => { const newSlot = googletag.defineSlot(adUnit, sizes, div); newSlot.addService(googletag.pubads()); googletag.display(div); }); } if (typeof window.googletag == "undefined") { document.body.append( document .createRange() .createContextualFragment( '<script async src="https://securepubads.g.doubleclick.net/tag/js/gpt.js"></script>' ) ); } window.googletag = window.googletag || { cmd: [] }; googletag.cmd.push(() => { googletag.pubads().collapseEmptyDivs(); googletag.pubads().setCentering(true); googletag.enableServices(); googletag.pubads().addEventListener("slotRenderEnded", (event) => { window.dispatchEvent( new CustomEvent("gam_slot_render", { detail: { blockId: event.slot.getSlotElementId(), isEmpty: event.isEmpty, size: event.size, }, }) ); }); });
        '''));
  }
}
