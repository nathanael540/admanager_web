import "package:universal_html/html.dart";
import "package:universal_html/js.dart" as js;

class AdRewarded {
  factory AdRewarded() {
    return _instance;
  }
  AdRewarded._internal();

  static final AdRewarded _instance = AdRewarded._internal()..listen();

  Function? _onAdLoaded;
  Function? _onAdClosed;
  Function(int amount)? _onGranted;

  bool _adLoaded = false;
  bool get adLoaded => _adLoaded;

  void listen() {
    window.addEventListener('gam_slot_rewarded_ready', (event) {
      _adLoaded = true;
      if (_onAdLoaded != null) _onAdLoaded!();
    });

    window.addEventListener('gam_slot_rewarded_closed', (event) {
      _adLoaded = false;
      if (_onAdClosed != null) _onAdClosed!();
    });

    window.addEventListener('gam_slot_rewarded_granted', (Event event) {
      if (event is CustomEvent) {
        var detail = event.detail;
        if (detail['amount'] != null) {
          if (_onGranted != null) _onGranted!(detail['amount']);
        }
      }
      _adLoaded = false;
    });
  }

  void load({required String adUnitId, Function? onAdLoaded}) {
    _onAdLoaded = onAdLoaded;
    js.context.callMethod('adManagerPluginLoadRewarded', [adUnitId]);
  }

  void show({Function? onAdClosed, Function(int)? onGranted}) {
    if (!_adLoaded) return;

    _onAdClosed = onAdClosed;
    _onGranted = onGranted;
    js.context.callMethod('adManagerPluginShowRewarded');
  }
}
