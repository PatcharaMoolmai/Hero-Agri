import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}

class FooterNavigator extends StatefulWidget {
  final List<FABBottomAppBarItem> items;
  final ValueChanged<int> onTabSelected;

  const FooterNavigator({Key key, this.items, this.onTabSelected}) : super(key: key);
  @override
  _FooterNavigatorState createState() => _FooterNavigatorState();
}

class _FooterNavigatorState extends State<FooterNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class FooterTileCard extends StatelessWidget {
  const FooterTileCard({
    @required this.child,
    this.color,
    this.header,
    this.padding =
        const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0, bottom: 4.0),
    this.insets = const EdgeInsets.all(5.0),
  });

  final Widget child;
  final Color color;
  final Widget header;
  final EdgeInsets padding;
  final EdgeInsets insets;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Material(
          elevation: 8.0,
          shadowColor: Colors.black45,
          borderRadius: const BorderRadius.all(Radius.circular(40.0)),
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
class FooterTileCardButton extends StatelessWidget {
  const FooterTileCardButton({
    @required this.child,
    this.color,
    this.header,

  });

  final Widget child;
  final Color color;
  final Widget header;


  @override
  Widget build(BuildContext context) => Container(
        child: Material(
          elevation: 8.0,
          shadowColor: Colors.black45,
          borderRadius: const BorderRadius.all(Radius.circular(40.0)),
          color: color ?? Theme.of(context).colorScheme.surface,
          child: Container(
            // padding: insets,
            width: 50,
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