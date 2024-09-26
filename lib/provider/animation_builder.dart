import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatefulWidget {
  final Size startSize;
  final Offset startPosition;
  final Size endSize;
  final Offset endPosition;
  final Curve curve;
  final Widget Function(BuildContext context, Size size, Offset position, bool animationCompleted, VoidCallback? onReturnCallMethod) builder;

  const CustomAnimatedContainer({
    super.key,
    required this.startSize,
    required this.startPosition,
    required this.endSize,
    required this.endPosition,
    this.curve = Curves.easeInToLinear,
    required this.builder,
  });

  @override
  CustomAnimatedContainerState createState() => CustomAnimatedContainerState();
}

class CustomAnimatedContainerState extends State<CustomAnimatedContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _sizeAnimation;
  late Animation<Offset> _positionAnimation;
  bool _animationCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _sizeAnimation = Tween<Size>(
      begin: widget.startSize,
      end: widget.startSize,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );

    _positionAnimation = Tween<Offset>(
      begin: widget.startPosition,
      end: widget.startPosition,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _animationCompleted = true;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _sizeAnimation = Tween<Size>(
          begin: widget.startSize,
          end: widget.endSize,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: widget.curve,
          ),
        );

        _positionAnimation = Tween<Offset>(
          begin: widget.startPosition,
          end: widget.endPosition,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: widget.curve,
          ),
        );

        _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> reverseAnimation() async {
    setState(() {
      _animationCompleted = false;
    });
    await _controller.reverse();
  }

  Future<void> popWithAnimation() async {
    await reverseAnimation();
    Navigator.pop(context);
  }

  Future<bool> _onWillPop() async {
    await reverseAnimation();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final size = _sizeAnimation.value;
          final position = _positionAnimation.value;
          return widget.builder(context, size, position, _animationCompleted, popWithAnimation);
        },
      ),
    );
  }
}
