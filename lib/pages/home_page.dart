import 'package:flutter/material.dart';
import '../models/app_models.dart';
import '../components/weather_card.dart';
import '../components/device_card.dart';
import '../components/add_device_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentWeatherIndex = 0;
  int _selectedDeviceIndex = 1;

  final List<WeatherData> weatherLocations = [
    WeatherData(
      location: 'Island Park', day: 'Sunday', date: 'Nov 14',
      temperature: 48, condition: 'Sunny', windSpeed: 3.7,
      chanceOfIce: 5, pressure: 1010, humidity: 83,
    ),
    WeatherData(
      location: 'Garden City', day: 'Sunday', date: 'Nov 14',
      temperature: 29, condition: 'Heavy rain', windSpeed: 3.7,
      chanceOfIce: 70, pressure: 1010, humidity: 83,
    ),
  ];

  final List<DeviceData> devices = [
    DeviceData(
      location: 'Island Park, ID', temperature: 53,
      statusText: 'Drains are Safe!', needsAction: false,
    ),
    DeviceData(
      location: 'Garden City, UT', temperature: 29,
      statusText: 'Start Defrost!', needsAction: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 340,
                  child: PageView.builder(
                    itemCount: weatherLocations.length,
                    onPageChanged: (index) {
                      setState(() { _currentWeatherIndex = index; });
                    },
                    itemBuilder: (context, index) {
                      return WeatherCard(
                        data: weatherLocations[index],
                        isCurrentPage: _currentWeatherIndex == index,
                        totalPages: weatherLocations.length,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Devices', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                AddDeviceCard(onTap: () {}),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: DeviceCard(
                        data: devices[index],
                        isSelected: _selectedDeviceIndex == index,
                        onTap: () {
                          setState(() { _selectedDeviceIndex = index; });
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.home_outlined, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text('Home', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Icon(Icons.pie_chart_outline, color: Colors.grey),
          const Icon(Icons.access_time, color: Colors.grey),
          const Icon(Icons.person_outline, color: Colors.grey),
        ],
      ),
    );
  }
}
