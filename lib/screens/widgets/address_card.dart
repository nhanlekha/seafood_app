import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String addressDetails;
  final String shippingName;
  final String shippingPhone;
  final bool isDefault;
  final ValueChanged<bool> onDefaultChanged;

  const AddressCard({
    Key? key,
    required this.title,
    required this.addressDetails,
    required this.isDefault,
    required this.onDefaultChanged,
    required this.shippingPhone,
    required this.shippingName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on,
                    color: Colors.redAccent, size: 24),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Text(
                  shippingName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(' | ', style: TextStyle(color: Colors.black54, fontSize: 16)),
                Text(
                  shippingPhone,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              addressDetails,
              style: const TextStyle(
                  fontSize: 16, color: Colors.black54, height: 1.5),
            ),
            if (isDefault) const SizedBox(height: 10),
            if (isDefault)
              const Text(
                'Địa chỉ mặc định',
                style:
                    TextStyle(fontSize: 16, color: Colors.green, height: 1.5),
              ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text(
            //       'Đặt Làm Địa Chỉ Mặc Định',
            //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            //     ),
            //     Switch(
            //       value: isDefault,
            //       onChanged: onDefaultChanged,
            //       activeColor: Colors.teal,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
