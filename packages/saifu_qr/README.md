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
                        child: MultiQRcode(data: txtController.text),
                            )]));

This package includes addition features that will enable you to change it to suit your criteria.

| # Swiper Layouts | # Screenshot                         | # Code Example       |
| ---------------- | ------------------------------------ | -------------------- |
| # Stack          | ![](/images/swiperLayoutStack.PNG)   | SwiperLayout.STACK   |
| # Tinder         | ![](/images/swiperLayoutTinder.PNG)  | SwiperLayout.TINDER  |
| # Default        | ![](/images/swiperLayoutDefault.PNG) | SwiperLayout.DEFAULT |
| # Custom         |                                      | SwiperLayout.CUSTOM  |

_refer to the Swiper library (https://github.com/best-flutter/flutter_swiper) for more information on layouts and building a custom one.
to build a custom one or issue with NULL error at initialisation of multiple frames : https://github.com/best-flutter/flutter_swiper/issues/139#issuecomment-553876950 _

e.g.
| # Control | # Screenshot | # Code Example |
| ----------------------------- | ------------------------ | ------------------------------------------------------ |
| # SwiperControl | ![](/images/controls.PNG) | control: new SwiperControl(color: Colors.red), | |
| # Page Indicator.(DROP/SLIDE e.g.) | ![](/images/paginationDot.PNG) | PageIndicatorLayout.DROP| |

Pagination Builder
| # Page Pagination Types | # Screenshot | # Code Example |
| ----------------------------- | ------------------------ | ------------------------------------------------------ |
| # DotSwiper| ![](/images/paginationDot.PNG) | DotSwiperPaginationBuilder() |
| # Fraction| ![](/images/fractionPaginationBuilder.PNG) | FractionPaginationBuilder(); |
| # RectSwiper // No Indicator| ![](/images/swiperLayoutDefault.PNG =250x) | RectSwiperPaginationBuilder |

These properties are required to be depending on the type of builder used:
itemHeight: x --> this property is valid if layout=STACK or layout=TINDER or LAYOUT=CUSTOM,
itemWidth: x --> this property is valid if layout=STACK or layout=TINDER or LAYOUT=CUSTOM,
