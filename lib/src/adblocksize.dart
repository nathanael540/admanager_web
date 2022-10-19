/// Ad Sizes that can be used for resquests banner ads from AdManager
class AdBlockSize {
  /// Our constructor with the width and height for the ad
  const AdBlockSize({
    required this.width,
    required this.height,
  });

  /// The height of the ad
  final int height;

  /// The width of the ad
  final int width;

  /// A banner ad that has 728px width and 90px height
  static const AdBlockSize leaderboard = AdBlockSize(
    width: 728,
    height: 90,
  );

  /// A banner ad that has 336px width and 280 height
  static const AdBlockSize largeRectangle = AdBlockSize(
    width: 336,
    height: 280,
  );

  /// A banner ad that has 300px width and 250px height
  static const AdBlockSize mediumRectangle = AdBlockSize(
    width: 300,
    height: 250,
  );

  /// A banner ad that has 468px width and 60px height
  static const AdBlockSize banner = AdBlockSize(
    width: 468,
    height: 60,
  );

  /// A banner ad that has 300px width and 50px height
  static const AdBlockSize mobileBanner = AdBlockSize(
    width: 300,
    height: 50,
  );

  /// A banner ad that has 320px width and 50px height
  static const AdBlockSize mobileLeaderboard = AdBlockSize(
    width: 320,
    height: 50,
  );

  /// A banner ad that has 300px width and 100px height
  static const AdBlockSize mobileBannerLarger = AdBlockSize(
    width: 300,
    height: 100,
  );

  /// A banner ad that has 120px width and 600px height
  static const AdBlockSize skyscraper = AdBlockSize(
    width: 120,
    height: 600,
  );

  /// A banner ad that has 160px width and 600px height
  static const AdBlockSize wideSkyscraper = AdBlockSize(
    width: 160,
    height: 600,
  );

  /// A banner ad that has 300px width and 600px height
  static const AdBlockSize helfPage = AdBlockSize(
    width: 300,
    height: 600,
  );
}
