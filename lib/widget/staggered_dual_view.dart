import 'package:flutter/material.dart';

class StaggeredDualView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing, aspectRatio, offsetPercent;

  const StaggeredDualView(
      {Key key,
      @required this.itemBuilder,
      @required this.itemCount,
      this.offsetPercent = 0.5,
      this.spacing = 0.0,
      this.aspectRatio = 0.5})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemHeight = (width * 0.5) / aspectRatio;
        final height = constraints.maxHeight;
        return OverflowBox(
          minWidth: width,
          minHeight: height,
          maxHeight: height,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: aspectRatio,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Transform.translate(
                offset:
                    Offset(0.0, index.isOdd ? itemHeight * offsetPercent : 0.0),
                child: itemBuilder(context, index),
              );
            },
          ),
        );
      },
    );
  }
}
