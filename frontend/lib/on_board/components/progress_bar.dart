import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required AnimationController progressController,
    required this.length,
    required this.value,
  }) : _progressController = progressController;

  final AnimationController _progressController;
  final int length;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        length,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: AnimatedBuilder(
              animation: _progressController,
              builder: (BuildContext context, Widget? child) {
                return SizedBox(
                  height: 6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: LinearProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.redAccent),
                      backgroundColor: Colors.black26,
                      value: value - index,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
