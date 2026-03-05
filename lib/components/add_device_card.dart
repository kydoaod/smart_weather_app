import 'package:flutter/material.dart';

class AddDeviceCard extends StatelessWidget {
  final VoidCallback onTap;

  const AddDeviceCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Add New Device', style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600)),
            const SizedBox(width: 12),
            Container(decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey), child: const Icon(Icons.add, color: Colors.white, size: 20))
          ],
        ),
      ),
    );
  }
}
