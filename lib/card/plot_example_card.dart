import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlotCard extends StatelessWidget {
  const PlotCard({
    // Key key,
    @required this.child,
    this.padding =
        const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0, bottom: 4.0),
    this.color,
    this.header,
    this.insets,
    this.imageLocation,
    this.plotLocation,
    this.plotName,
    this.fruitLogo,
  });
  final Widget child;
  final Color color;
  final Widget header;
  final EdgeInsets padding;
  final EdgeInsets insets;
  final String imageLocation;
  final String plotLocation;
  final String plotName;
  final String fruitLogo;

  @override
  Widget build(BuildContext context) {
    String plotLocation;
    String plotName;
    return Padding(
      padding: padding,
      child: Material(
        elevation: 8.0,
        shadowColor: Colors.black45,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: color ?? Theme.of(context).colorScheme.surface,
        child: Container(
          child: Column(
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(imageLocation)),
              ),
              ListTile(
                leading: Image.asset(fruitLogo),
                title: Text(plotName),
                subtitle: Text(plotLocation),
              )
            ],
          ),
        ),
      ),
    );
  }
}
