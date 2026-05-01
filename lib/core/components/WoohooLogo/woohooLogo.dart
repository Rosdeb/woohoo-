import 'package:flutter/material.dart';

class WoohooLogo extends StatelessWidget {
  const WoohooLogo({super.key});

  @override
  Widget build(BuildContext context) {
    // Helper to create the angled '!'
    Widget angledExclamation(Color color) => Transform.rotate(
      angle: 0.15, // Adjusted to match the reference angle better
      child: Text(
        '!',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w900,
          color: color,
          letterSpacing: -1,
        ),
      ),
    );

    // Helper to create the text row with correct color logic
    Widget woohooText({required bool isShadow}) {
      final Color mainColor = isShadow ? Colors.black.withOpacity(0.25) : Colors.black;
      final Color accentColor = isShadow ? Colors.black.withOpacity(0.25) : const Color(0xFFFF7A00);

      return RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: mainColor,
            letterSpacing: -1,
          ),
          children: [
            TextSpan(
              text: 'W',
              style: TextStyle(color: accentColor),
            ),
            const TextSpan(text: 'OOHOO'),
            const WidgetSpan(child: SizedBox(width: 4)),
            WidgetSpan(child: angledExclamation(accentColor)),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFA6FF4D), // Lime green
        borderRadius: BorderRadius.circular(12),
        // Combined Gradient Border Effect
        border: Border.all(
          color: const Color(0xFF4DEFFF), // Cyan
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFFF00FF), // Magenta shadow
            offset: Offset(0, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: IntrinsicWidth(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 1. Drop Shadow Layer (Shifted)
            Transform.translate(
              offset: const Offset(2, 2),
              child: woohooText(isShadow: true),
            ),
            // 2. Main Text Layer
            woohooText(isShadow: false),
          ],
        ),
      ),
    );
  }
}