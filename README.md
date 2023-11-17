# AdManager Web Flutter

Simple package that allow us display ads from Ad Manager in Flutter Web. This was primarily created to display Adsense ads on Flutter Web.

## Features

- Request ad from Ad Manager Network
- Can run Adsense ad in a Flutter Web App

## Usage

Add `admanager_web` as a dependency in your pubspec.yaml file.

Import the packeage:

```dart
import 'package:admanager_web/admanager_web.dart';
```

Initialize our plugin to load all JS things (Need be called before the first ad request):

```dart
AdManagerWeb.init();
```

Just add the AdBlock widget to show the ad where you like:

```dart
[...]
 AdBlock(
     size: [AdBlockSize.largeRectangle],
     adUnitId: "/6355419/Travel/Europe",
 )
[...]
```

Load Rewarded Ad:

```dart
[...]
 AdRewarded().load(
    adUnitId: '/22639388115/rewarded_web_example',
    onAdLoaded: (){},
 )
[...]
```

Show Rewarded Ad:

```dart
[...]
 AdRewarded().show(
    onAdClosed: (){},
    onGranted: (int amount){},
 );
[...]
```

## Additional information

For more performance add the GPT.js Library directly in your head in index.html file:

```html
<script
  async
  src="https://securepubads.g.doubleclick.net/tag/js/gpt.js"
></script>
```

This package was made in order to show Google Adsense ads on Flutter Web in a simple way. Its still in its infancy, and any help to make it better and more efficient will be appreciated.

## Made with ♥ from Brazil 🇧🇷

It was made in Brazil by Nathanael Ferreira.
