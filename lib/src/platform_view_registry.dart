// add either a dynamically typed variable
dynamic platformViewRegistry;

// or a more thorough shim like this one
class FakePlatformViewRegistry {
  void registerViewFactory(
      String viewTypeId, dynamic Function(int) viewFactory) {
         throw UnsupportedError("platform view registry in non-web context");
      }
}
final plataformFake =  platformViewRegistry ?? FakePlatformViewRegistry();