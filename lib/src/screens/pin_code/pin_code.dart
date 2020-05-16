import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cake_wallet/palette.dart';
import 'package:cake_wallet/src/stores/settings/settings_store.dart';
import 'package:cake_wallet/generated/i18n.dart';

abstract class PinCodeWidget extends StatefulWidget {
  PinCodeWidget({Key key, this.onPinCodeEntered, this.hasLengthSwitcher})
      : super(key: key);

  final Function(List<int> pin, PinCodeState state) onPinCodeEntered;
  final bool hasLengthSwitcher;
}

class PinCode extends PinCodeWidget {
  PinCode(Function(List<int> pin, PinCodeState state) onPinCodeEntered,
      bool hasLengthSwitcher, Key key)
      : super(
            key: key,
            onPinCodeEntered: onPinCodeEntered,
            hasLengthSwitcher: hasLengthSwitcher);

  @override
  PinCodeState createState() => PinCodeState();
}

class PinCodeState<T extends PinCodeWidget> extends State<T> {
  static const defaultPinLength = 4;
  static const sixPinLength = 6;
  static const fourPinLength = 4;
  static final deleteIconImage = Image.asset('assets/images/delete_icon.png');
  static final backArrowImage = Image.asset('assets/images/back_arrow.png');
  final _gridViewKey = GlobalKey();

  int pinLength = defaultPinLength;
  List<int> pin = List<int>.filled(defaultPinLength, null);
  String title = S.current.enter_your_pin;
  double _aspectRatio = 0;

  void setTitle(String title) => setState(() => this.title = title);

  void clear() => setState(() => pin = List<int>.filled(pinLength, null));

  void onPinCodeEntered(PinCodeState state) =>
      widget.onPinCodeEntered(state.pin, this);

  void changePinLength(int length) {
    final newPin = List<int>.filled(length, null);

    setState(() {
      pinLength = length;
      pin = newPin;
    });
  }

  void setDefaultPinLength() {
    final settingsStore = Provider.of<SettingsStore>(context);

    pinLength = settingsStore.defaultPinLength;
    changePinLength(pinLength);
  }

  void calculateAspectRatio() {
    final renderBox =
        _gridViewKey.currentContext.findRenderObject() as RenderBox;
    final cellWidth = renderBox.size.width / 3;
    final cellHeight = renderBox.size.height / 4;

    if (cellWidth > 0 && cellHeight > 0) {
      _aspectRatio = cellWidth / cellHeight;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(afterLayout);
  }

  void afterLayout(dynamic _) {
    setDefaultPinLength();
    calculateAspectRatio();
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: body(context));

  Widget body(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
      child: Column(children: <Widget>[
        Spacer(flex: 2),
        Text(title,
            style: TextStyle(fontSize: 24, color: Theme.of(context).primaryTextTheme.title.color)),
        Spacer(flex: 3),
        Container(
          width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(pinLength, (index) {
              const size = 10.0;
              final isFilled = pin[index] != null;

              return Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isFilled ? PaletteBittube.primary : Colors.transparent,
                    border: Border.all(color: Theme.of(context).buttonColor,)
                    ));
            }),
          ),
        ),
        Spacer(flex: 2),
        if (widget.hasLengthSwitcher) ...[
          FlatButton(
              onPressed: () {
                changePinLength(pinLength == PinCodeState.fourPinLength
                    ? PinCodeState.sixPinLength
                    : PinCodeState.fourPinLength);
              },
              child: Text(
                _changePinLengthText(),
                style: TextStyle(fontSize: 16.0, color: Palette.wildDarkBlue),
              ))
        ],
        Spacer(flex: 1),
        Flexible(
            flex: 24,
            child: Container(
                key: _gridViewKey,
                child: _aspectRatio > 0
                    ? GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: _aspectRatio,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(12, (index) {
                          const double marginRight = 15;
                          const double marginLeft = 15;

                          if (index == 9) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: marginLeft, right: marginRight),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).buttonColor,
                              ),
                            );
                          } else if (index == 10) {
                            index = 0;
                          } else if (index == 11) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: marginLeft, right: marginRight),
                              child: FlatButton(
                                onPressed: () => _pop(),
                                color: Theme.of(context).buttonColor,
                                shape: CircleBorder(),
                                child: deleteIconImage,
                              ),
                            );
                          } else {
                            index++;
                          }

                          return Container(
                            margin: EdgeInsets.only(
                                left: marginLeft, right: marginRight),
                            child: FlatButton(
                              onPressed: () => _push(index),
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .title
                                  .backgroundColor,
                              shape: CircleBorder(),
                              child: Text('$index',
                                  style: TextStyle(
                                      fontSize: 23.0, color: Theme.of(context).primaryTextTheme.title.color)),
                            ),
                          );
                        }),
                      )
                    : null))
      ]),
    ));
  }

  void _push(int num) {
    if (currentPinLength() >= pinLength) {
      return;
    }

    for (var i = 0; i < pin.length; i++) {
      if (pin[i] == null) {
        setState(() => pin[i] = num);
        break;
      }
    }

    final _currentPinLength = currentPinLength();

    if (_currentPinLength == pinLength) {
      onPinCodeEntered(this);
    }
  }

  void _pop() {
    if (currentPinLength() == 0) {
      return;
    }

    for (var i = pin.length - 1; i >= 0; i--) {
      if (pin[i] != null) {
        setState(() => pin[i] = null);
        break;
      }
    }
  }

  int currentPinLength() {
    return pin.fold(0, (v, e) {
      if (e != null) {
        return v + 1;
      }

      return v;
    });
  }

  String _changePinLengthText() {
    return S.current.use +
        (pinLength == PinCodeState.fourPinLength
            ? '${PinCodeState.sixPinLength}'
            : '${PinCodeState.fourPinLength}') +
        S.current.digit_pin;
  }
}
