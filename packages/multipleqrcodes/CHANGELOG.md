## [0.0.1] - 2020-12-08

The initial release supports generating one to many QR-codes, that that will be displayed to the user.

A single QRcode will simply be shown.
Many QRcodes (large QRcode broken into smaller ones), will be displayed and animated from one to other.

This release includes addition features that will enable you to change it to suit your criteria.

#### Usage

To use this plugin, add multiple_qrcodes as a dependency in your [pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

Import it into your dart file

    import 'package:multiple_qrcodes/multiple_qrcodes.dart';

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
