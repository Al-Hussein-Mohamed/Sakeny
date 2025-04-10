import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sakeny/utils/constants/const_images.dart';

List<String> preloadSvgList= [
  ConstImages.drawerIcon,
  ConstImages.searchLogo,
  ConstImages.searchSettings,
];

List<String> preLoadImagesList = [
  ConstImages.onboarding1,
  ConstImages.onboarding2,
  ConstImages.onboarding3,
  ConstImages.loginLogo,
  ConstImages.logo,
  ConstImages.facebookIcon,
  ConstImages.googleIcon,
  ConstImages.microsoftIcon,
  ConstImages.profilePic,
];


Future<void> loadAssets(BuildContext context) async{
  print("Loading assets...");
  List<Future> futures = [];
  futures.add(preLoadSVGs(preloadSvgList));
  futures.add(preLoadImages(preLoadImagesList, context));


  await Future.wait(futures);
}

Future<void> preLoadSVGs(List<String> svgAssets) async {
  List<Future> futures = [];
  for(String svgAsset in svgAssets) {
    final loader = SvgAssetLoader(svgAsset);
    futures.add(svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null)));
  }



  await Future.wait(futures);
}

Future<void> preLoadImages(List <String> imageAssets, BuildContext context) async {
  List<Future> futures = [];
  for(String imageAsset in imageAssets) {
    final image = AssetImage(imageAsset);
    futures.add(precacheImage(image, context));
  }

  await Future.wait(futures);
}