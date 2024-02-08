import 'package:flutter/material.dart';
import 'package:flutter_application_1/servises/add_helper/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAdScreen extends StatefulWidget {
  const GoogleAdScreen({super.key});

  @override
  State<GoogleAdScreen> createState() => _GoogleAdScreenState();
}
BannerAd? _bannerAd;
 
 
class _GoogleAdScreenState extends State<GoogleAdScreen> {
  @override
  void initState() {
    super.initState();
 
  // TODO: Load a banner ad
  BannerAd(
    adUnitId: AdHelper.bannerAdUnitId,
    request:  const AdRequest(),
    size: AdSize.banner,
    listener: BannerAdListener(
      onAdLoaded: (ad) {
        setState(() {
          _bannerAd = ad as BannerAd;
        });
      },
      onAdFailedToLoad: (ad, err) {
        print('Failed to load a banner ad: ${err.message}');
        ad.dispose();
      },
    ),
  ).load();
}
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Center(
             
            ),
            // TODO: Display a banner when ready
            if (_bannerAd != null)
              Align(
                alignment: Alignment.topCenter,
                child:  Container(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
          ],
        ),
      ),
    );
  
  }
}