library multiple_qrcodes;

import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MultiQRcode extends StatefulWidget {
  var data;
  var frameData;
  var charPerFrame;
  double transitionDuration;
  final double fade;
  final double scale;
  final SwiperLayout layout;
  final bool loop;
  final bool autoplay;
  final double viewportFraction;
  final PageIndicatorLayout indicatorLayout;
  final Axis scrollDirection;
  //final Alignment paginationAlignment;
  //final Color paginationColor;
  //final Color paginationActiveColor;
  final Color boxShadowColor;
  final Offset boxShadowOffset;
  final double boxShadowBlurRadius;
  final int errorCorrectionalLevel;
  final String qrErrorMessage;
  final double minCharacterSize;
  final double maxCharacterSize;
  final int charSliderDivisions;
  final minTransitionDuration;
  final maxTransitionDuration;

  MultiQRcode({
    Key key,
    this.charPerFrame: 100,
    @required this.data,
    this.frameData,
    this.transitionDuration: 600,
    this.fade,
    this.scale,
    this.layout: SwiperLayout.DEFAULT,
    this.loop: false,
    this.autoplay: true,
    this.viewportFraction: 0.8,
    this.indicatorLayout,
    this.scrollDirection: Axis.horizontal,
    //this.paginationAlignment,
    //this.paginationColor: Colors.grey,
    //this.paginationActiveColor: const Color(0xff38547C),
    this.boxShadowColor: Colors.grey,
    this.boxShadowOffset: const Offset(0.0, 1.0),
    this.boxShadowBlurRadius: 15,
    this.errorCorrectionalLevel: QrErrorCorrectLevel.H,
    this.qrErrorMessage: "QR code could not be generated",
    this.minCharacterSize: 10,
    this.maxCharacterSize: 200,
    this.charSliderDivisions: 5,
    this.minTransitionDuration: 200,
    this.maxTransitionDuration: 1200,
  }) : super(key: key);

  @override
  _MultiQRcodeState createState() => _MultiQRcodeState();
}

class _MultiQRcodeState extends State<MultiQRcode> {
  @override
  void initState() {
    handleQRData();
    super.initState();
  }

  void handleQRData() {
    var stringData = '';
    for (int i = 0; i < widget.data.length; i++) {
      stringData = stringData + widget.data[i].toString();
      setState(() {
        widget.frameData = stringData;
      });
    }
    RegExp exp = new RegExp(".{1," + widget.charPerFrame.toStringAsFixed(0) + "}");
    String str = widget.frameData;
    Iterable<Match> matches = exp.allMatches(str);
    var list = matches.map((m) => m.group(0)).toList();
    setState(() {
      widget.data = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.length > 0) {
      return Stack(
        children: [
          Swiper(
            fade: widget.fade,
            scale: widget.scale,
            loop: widget.loop,
            autoplay: widget.autoplay,
            duration: widget.transitionDuration.toInt(),
            viewportFraction: widget.viewportFraction,
            layout: widget.layout,
            indicatorLayout: widget.indicatorLayout,
            scrollDirection: widget.scrollDirection,
            itemCount: widget.data.length,
            //pagination: new SwiperPagination(alignment: widget.paginationAlignment, builder: RectSwiperPaginationBuilder(color: widget.paginationColor, activeColor: widget.paginationActiveColor)),
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(50),
                    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(12)), boxShadow: [
                      BoxShadow(color: widget.boxShadowColor, offset: widget.boxShadowOffset, blurRadius: widget.boxShadowBlurRadius) //(x,y)
                    ]),
                    child: QrImage(
                      data: widget.data[index],
                      version: QrVersions.auto,
                      errorCorrectionLevel: widget.errorCorrectionalLevel,
                      errorStateBuilder: (ctx, err) {
                        return Container(
                            child: Center(
                                child: Text(
                          widget.qrErrorMessage,
                          textAlign: TextAlign.center,
                        )));
                      },
                    ),
                  )
                ],
              );
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(50),
              child: SizedBox(
                width: 200,
                child: Slider(
                  value: widget.charPerFrame,
                  min: widget.minCharacterSize,
                  max: widget.maxCharacterSize,
                  divisions: widget.charSliderDivisions,
                  activeColor: Colors.grey[200],
                  onChanged: (newCharacterSize) {
                    setState(() {
                      widget.charPerFrame = newCharacterSize;
                      handleQRData();
                    });
                  },
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: RotatedBox(
              quarterTurns: 1,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(50),
                child: SizedBox(
                  width: 200,
                  child: Slider(
                    value: widget.transitionDuration,
                    min: widget.minTransitionDuration,
                    max: widget.maxTransitionDuration,
                    divisions: 10,
                    activeColor: Colors.grey[200],
                    onChanged: (newTransitionDuration) {
                      setState(() {
                        widget.transitionDuration = newTransitionDuration;
                      });
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Text('Data provided is not null or empty')
        ],
      );
    }
  }
}
