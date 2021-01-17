# saifu_qr

A package that enables single to many QR code generation

A single QRcode will simply be shown.
Many QRcodes (large QRcode broken into smaller ones), will be displayed and animated from one to other.

This package includes addition features that will enable you to change it to suit your criteria.

#### Usage

To use this plugin, add multiple_qrcodes as a dependency in your [pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

Import it into your dart file

    import 'package:saifu_qr/saifu_sq.dart';

#### Example

        return AlertDialog(
            content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    SizedBox(
                        width: 500,
                        height: 500,
                        child: SaifuQR(data: txtController.text),
                            )]));

This package includes addition features that will enable you to change it to suit your criteria.

| # Swiper Layouts | # Screenshot                                            | # Code Example       |
| ---------------- | ------------------------------------------------------- | -------------------- |
| # Stack          | <img src="https://imgur.com/5m0Os8S.png"  height="400"> | SwiperLayout.STACK   |
| # Tinder         | <img src="https://imgur.com/7vmtVuh.png"  height="400"> | SwiperLayout.TINDER  |
| # Default        | <img src="https://imgur.com/hykj6dO.png"  height="400"> | SwiperLayout.DEFAULT |
| # Custom         |                                                         | SwiperLayout.CUSTOM  |

_refer to the Swiper library (https://github.com/best-flutter/flutter_swiper) for more information on layouts and building a custom one.
to build a custom one or issue with NULL error at initialisation of multiple frames : https://github.com/best-flutter/flutter_swiper/issues/139#issuecomment-553876950 _

## SwiperControl

control: new SwiperControl(color: Colors.red)
<img src="https://imgur.com/exoJHM7.png"  height="400">

## Page Indicator.(DROP/SLIDE e.g.)

PageIndicatorLayout.DROP
<img src="https://imgur.com/WAb3tmW.png"  height="400">

# Pagination Builder

DotSwiper
DotSwiperPaginationBuilder()
<img src="https://imgur.com/WAb3tmW.png"  height="400">

Fraction
FractionPaginationBuilder();
<img src="https://imgur.com/QFBz9Wj.png"  height="400">

RectSwiper
RectSwiperPaginationBuilder();
<img src="https://imgur.com/hykj6dO.png"  height="400">

These properties are required to be depending on the type of builder used:
e.g.
itemHeight: x --> this property is valid if layout=STACK or layout=TINDER or LAYOUT=CUSTOM,
itemWidth: x --> this property is valid if layout=STACK or layout=TINDER or LAYOUT=CUSTOM,
