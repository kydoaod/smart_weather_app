import 'package:flutter/material.dart';
import '../models/app_models.dart';

class DeviceCard extends StatelessWidget {
  final DeviceData data;
  final bool isSelected;
  final VoidCallback onTap;

  const DeviceCard({super.key, required this.data, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(color: Colors.cyanAccent.shade400, width: 2) : Border.all(color: Colors.transparent, width: 2),
          boxShadow: [BoxShadow(color: isSelected ? Colors.cyanAccent.withOpacity(0.2) : Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${data.temperature}', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, height: 1)),
                const Text('°', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.location, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(data.statusText, style: TextStyle(fontSize: 12, color: data.needsAction ? Colors.redAccent : Colors.grey)),
                ],
              ),
            ),
            const Icon(Icons.eco_outlined, color: Colors.grey, size: 30),
          ],
        ),
      ),
    );
  }
}
