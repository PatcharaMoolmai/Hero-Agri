import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  const TileCard({
    @required this.child,
    this.color,
    this.header,
    this.padding =
        const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0, bottom: 4.0),
    this.insets = const EdgeInsets.all(5.0),
    this.elevation = 7.0,
    this.borderRadius = 10.0,
  });

  final Widget child;
  final Color color;
  final Widget header;
  final EdgeInsets padding;
  final EdgeInsets insets;
  final double elevation;
  final double borderRadius;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Material(
          elevation: elevation,
          shadowColor: Color(0xFF2B7100).withOpacity(0.7),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: color ?? Theme.of(context).colorScheme.surface,
          child: Container(
            padding: insets,
            child: Column(
              children: <Widget>[
                header ?? Container(),
                child,
              ],
            ),
          ),
        ),
      );
}
