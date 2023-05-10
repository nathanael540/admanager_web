/// Class that represents the size of an ad block
class AdBlockSize {
  const AdBlockSize({
    required this.width,
    required this.height,
  });

  final int height;

  final int width;

  static const AdBlockSize leaderboard = AdBlockSize(
    width: 728,
    height: 90,
  );

  static const AdBlockSize largeRectangle = AdBlockSize(
    width: 336,
    height: 280,
  );

  static const AdBlockSize mediumRectangle = AdBlockSize(
    width: 300,
    height: 250,
  );

  static const AdBlockSize banner = AdBlockSize(
    width: 468,
    height: 60,
  );

  static const AdBlockSize mobileBanner = AdBlockSize(
    width: 300,
    height: 50,
  );

  static const AdBlockSize mobileLeaderboard = AdBlockSize(
    width: 320,
    height: 50,
  );

  static const AdBlockSize mobileBannerLarger = AdBlockSize(
    width: 300,
    height: 100,
  );

  static const AdBlockSize skyscraper = AdBlockSize(
    width: 120,
    height: 600,
  );

  static const AdBlockSize wideSkyscraper = AdBlockSize(
    width: 160,
    height: 600,
  );

  static const AdBlockSize helfPage = AdBlockSize(
    width: 300,
    height: 600,
  );
}
