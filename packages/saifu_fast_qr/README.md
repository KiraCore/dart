# saifu_fast_qr

This is Fast QR displaying, for faster scanning and sharing of QR data.

This is a varient of the original [SaifuQR](https://pub.dev/packages/saifu_qr) package

A package that enables single to many QR code generation.A single QRcode will simply be shown. Many QRcodes (large QRcode broken into smaller ones), will be displayed and animated from one to other.

This package includes addition features that will enable you to change it to suit your criteria.

#### Usage

To use this plugin, add saifu_fast_qr as a dependency in your [pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

Import it into your dart file

    import 'package:saifu_fast_qr/saifu_fast_qr.dart';

#### Example

                    SizedBox(
                        width: 500,
                        height: 500,
                        child: SaifuFastQR(data: "Hello World"),
                            );
