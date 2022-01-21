import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _SwitchBoxProps { paddingLeft, color, text, rotation }

class SwitchActiveInactive extends StatelessWidget {
  final bool switched;

  SwitchActiveInactive({this.switched});

  @override
  Widget build(BuildContext context) {
    var tween = MultiTween<_SwitchBoxProps>()
      ..add(_SwitchBoxProps.paddingLeft, 0.0.tweenTo(60.0), 1.seconds)
      ..add(_SwitchBoxProps.color, Colors.red[900].tweenTo(Colors.green[900]), 1.seconds)
      ..add(_SwitchBoxProps.text, ConstantTween("Public"), 500.milliseconds)
      ..add(_SwitchBoxProps.text, ConstantTween("Private"), 500.milliseconds)
      ..add(_SwitchBoxProps.rotation, (-2 * pi).tweenTo(0.0), 1.seconds);

    return CustomAnimation<MultiTweenValues<_SwitchBoxProps>>(
      control: switched
          ? CustomAnimationControl.PLAY
          : CustomAnimationControl.PLAY_REVERSE,
      startPosition: switched ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildSwitchBox,
    );
  }

  Widget _buildSwitchBox(
      context, child, MultiTweenValues<_SwitchBoxProps> value) {
    return Container(
      decoration: _outerBoxDecoration(value.get(_SwitchBoxProps.color)),
      width: 94,
      height: 30,
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: [
          Positioned(
              child:value.get(_SwitchBoxProps.text)=='Inactive'? Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Transform.rotate(
                    angle: value.get(_SwitchBoxProps.rotation),
                    child: Container(
                      decoration:
                      _innerBoxDecoration(value.get(_SwitchBoxProps.color)),
                      width: 30,
                      height: 34,

                    ),
                  ),
                  SizedBox(width: 3),

                  Text(value.get(_SwitchBoxProps.text),
                      style: labelStyle)
                ],
              ): Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:22.0),
                    child: Text(value.get(_SwitchBoxProps.text),
                        style: TextStyle(
                          fontSize: 10
                        )),
                  ),
                  SizedBox(width: 3),

                  Transform.rotate(
                    angle: value.get(_SwitchBoxProps.rotation),
                    child: Container(
                      decoration:
                      _innerBoxDecoration(value.get(_SwitchBoxProps.color)),
                      width: 30,
                      height: 34,

                    ),
                  )
                ],
              ))

        ],
      ),
    );
  }

  BoxDecoration _innerBoxDecoration(Color color) => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)), color: Colors.white);

  BoxDecoration _outerBoxDecoration(Color color) => BoxDecoration(
    color:color,
    gradient: LinearGradient(
      colors: [
        color,
        color.withAlpha(200),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.all(Radius.circular(25)),
    border: Border.all(
      width: 2,
      color: color,
    ),
  );

  static final labelStyle = TextStyle(
      height: 1.3,
      fontWeight: FontWeight.w100,
      fontFamily: "Roboto",
      color: Colors.white);
}
