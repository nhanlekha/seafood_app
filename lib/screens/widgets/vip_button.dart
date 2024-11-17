import 'package:flutter/material.dart';

class VipButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double borderRadius;
  final VoidCallback onPressed;
  final bool isFullWidth; // Thêm tùy chọn isFullWidth

  const VipButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.borderRadius = 8.0,
    required this.onPressed,
    this.isFullWidth = false, // Giá trị mặc định là false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null, // Chiều rộng full nếu isFullWidth = true
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
