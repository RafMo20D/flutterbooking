import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationListView extends StatefulWidget {
  @required final int index;
  @required final Widget child;
  AnimationListView({this.index, this.child});

  @override
  _AnimationListViewState createState() => _AnimationListViewState();
}

class _AnimationListViewState extends State<AnimationListView> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: widget.index,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: widget.child
        ),
      )
    );
  }
}
