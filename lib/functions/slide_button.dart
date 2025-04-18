import 'package:flutter/material.dart';

class SlideButton extends StatefulWidget {
  final VoidCallback onSlideComplete;
  final String text;

  const SlideButton({
    Key? key,
    required this.onSlideComplete,
    this.text = "Slide to Continue         > > > ",
  }) : super(key: key);

  @override
  _SlideButtonState createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton> {
  double _dragPosition = 0.0;
  double _maxDrag = 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // The slider button is square, so max drag is the width minus the height.
        _maxDrag = constraints.maxWidth - constraints.maxHeight;
        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            // Background track
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(constraints.maxHeight / 2),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Draggable slider button
            Positioned(
              left: _dragPosition,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _dragPosition += details.delta.dx;
                    if (_dragPosition < 0) _dragPosition = 0;
                    if (_dragPosition > _maxDrag) _dragPosition = _maxDrag;
                  });
                },
                onHorizontalDragEnd: (details) {
                  if (_dragPosition >= _maxDrag * 0.9) {
                    // Slide complete
                    widget.onSlideComplete();
                    setState(() {
                      _dragPosition = _maxDrag;
                    });
                  } else {
                    // Reset if not slid far enough
                    setState(() {
                      _dragPosition = 0;
                    });
                  }
                },
                child: Container(
                  width: constraints.maxHeight,
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(constraints.maxHeight / 2),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
