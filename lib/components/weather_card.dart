import 'package:flutter/material.dart';
import '../models/app_models.dart';

class WeatherCard extends StatelessWidget {
  final WeatherData data;
  final bool isCurrentPage;
  final int totalPages;

  const WeatherCard({super.key, required this.data, required this.isCurrentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Column(
        children: [
          Text(data.location, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalPages,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 8, height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCurrentPage ? Colors.black : Colors.grey.shade300,
                  border: Border.all(color: Colors.black, width: 1),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(data.condition == 'Sunny' ? Icons.wb_sunny : Icons.cloudy_snowing, size: 80),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${data.day}  |  ${data.date}'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${data.temperature}', style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold, height: 1.1)),
                      const Text('°', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text(data.condition),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatInfo(Icons.navigation, '${data.windSpeed} mph\nWind'),
              _buildStatInfo(Icons.ac_unit, '${data.chanceOfIce}%\nChance of ice', highlight: data.chanceOfIce > 50),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatInfo(Icons.thermostat, '${data.pressure} mbar\nPressure'),
              _buildStatInfo(Icons.water_drop_outlined, '${data.humidity}%\nHumidity ${data.humidity}%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatInfo(IconData icon, String text, {bool highlight = false}) {
    return Container(
      padding: highlight ? const EdgeInsets.all(8) : EdgeInsets.zero,
      decoration: highlight ? BoxDecoration(color: Colors.blue.withOpacity(0.15), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.blueAccent)) : null,
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
