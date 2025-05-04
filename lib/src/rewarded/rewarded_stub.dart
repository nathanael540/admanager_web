class AdRewarded {
  factory AdRewarded() {
    return _instance;
  }
  AdRewarded._internal();

  static final AdRewarded _instance = AdRewarded._internal()..listen();
  bool get adLoaded => false;

  void listen() {}

  void load({required String adUnitId, Function? onAdLoaded}) {}

  void show({Function? onAdClosed, Function(int)? onGranted}) {}
}
