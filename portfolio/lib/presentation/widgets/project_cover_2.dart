import 'package:flutter/material.dart';

class ProjectCover2 extends StatelessWidget {
  const ProjectCover2(
      {Key? key,
      this.width,
      this.height,
      this.offset,
      this.projectCoverUrl,
      this.projectCoverBackgroundColor,
      this.backgroundScale = 1,
      this.projectCoverScale = 1,
      this.alignment = Alignment.topLeft,
      this.origin = const Offset(0, 0)})
      : super(key: key);

  final double? width;
  final double? height;
  final double? offset;
  final double backgroundScale;
  final double projectCoverScale;
  final Offset origin;
  final AlignmentGeometry alignment;
  final String? projectCoverUrl;
  final Color? projectCoverBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            // right: offset,
            // bottom: offset,
            child: Transform.scale(
              scale: projectCoverScale,
              origin: const Offset(0, 0),
              alignment: alignment,
              child: Image.asset(
                projectCoverUrl!,
                width: width! - offset!,
                height: height! - offset!,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
