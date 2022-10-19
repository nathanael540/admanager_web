# AdManager Web Flutter

Simple package that allow us display ads from Ad Manager in Flutter Web. This was primarily created to display Adsense ads on Flutter Web.

## Features

- Load GPT.js Library from DoubleClick Servers
- Request ads from Ad Manager Network
- Can run Adsense ads in a Flutter Web App

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
     size: AdBlockSize.largeRectangle,
     adUnitId: "/6355419/Travel/Europe", 
 )
[...]
```

## Additional information

This package was made in order to show Google Adsense ads on Flutter Web in a simple way. Its still in its infancy, and any help to make it better and more efficient will be appreciated.
