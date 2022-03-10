part of shudhta;

class WaveHeader extends StatelessWidget {
  final String title;
  const WaveHeader({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = new Size(MediaQuery.of(context).size.width, 350);
    return Container(
      height: 350,
      child: Stack(
        children: <Widget>[
          CustomWaveClipperHeader(
            size: size,
            xOffset: 0,
            yOffset: 0,
          ),
          CustomWaveClipperHeader(
            size: size,
            xOffset: 50,
            yOffset: 10,
            duration: 1500,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Image.asset(
                //   'assets/images/icon_start.png',
                //   color: Colors.white,
                // ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomWaveClipperHeader extends StatefulWidget {
  final Size size;
  final int xOffset;
  final int yOffset;
  final int duration;

  CustomWaveClipperHeader({
    Key? key,
    required this.size,
    required this.xOffset,
    required this.yOffset,
    this.duration = 2000,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomWaveClipperHeaderState();
  }
}

class _CustomWaveClipperHeaderState extends State<CustomWaveClipperHeader>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  List<Offset> animList1 = [];

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));

    _animationController.addListener(() {
      animList1.clear();
      for (int i = -2 - widget.xOffset;
          i <= widget.size.width.toInt() + 2;
          i++) {
        animList1.add(Offset(
            i.toDouble() + widget.xOffset,
            sin((_animationController.value * 360 - i) %
                        360 *
                        Vector.degrees2Radians) *
                    20 +
                50 +
                widget.yOffset));
      }
    });
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: Container(
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
          builder: (context, child) => ClipPath(
            child: Container(
              width: widget.size.width,
              height: widget.size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Get.theme.primaryColor,
                  Get.theme.primaryColor.withOpacity(0.6)
                ],
              )),
            ),
            clipper: WaveClipper(_animationController.value, animList1),
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}
