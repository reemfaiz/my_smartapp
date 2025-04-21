import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:my_smartapp/langu.dart';
import 'package:my_smartapp/widgets/onboarding_progress.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentPicIndex = 0;
  List picList = ['smart.png', 'running.png', 'tennis.png', 'weights.png'];
  final List<PlayerData> playersData = [
    PlayerData(
      name: 'Mohammed',
      role: 'Football player',
      age: 16,
      weight: 45,
      sportsDevelopment: 0.8,
      stressLevels: [0.6, 0.7],
      fitnessLevels: [0.8, 0.9],
      injuriesCount: [0.2, 0.3],
    ),
    PlayerData(
      name: 'Salem',
      role: 'Football player',
      age: 18,
      weight: 49,
      sportsDevelopment: 0.6,
      stressLevels: [0.7, 0.5],
      fitnessLevels: [0.75, 0.85],
      injuriesCount: [0.4, 0.25],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.white, // Make AppBar transparent to show gradient
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 224, 197, 247)],
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: MediaQuery.of(
                    context,
                  ).size.width, // Set width to screen width
                  child: Image.asset(
                    'assets/images/Group 1984079898.png',
                    fit: BoxFit.fill, // Consider using BoxFit
                  ),
                ),
              ),
              Column(
                // Changed Center to Column to align bottom row
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (currentPicIndex == 3) {
                          currentPicIndex = 0;
                        } else {
                          currentPicIndex++;
                        }
                      });
                    },
                    child: SizedBox(
                      width: 400,
                      height: 150,
                      child: Image.asset(
                        // ignore: prefer_interpolation_to_compose_strings
                        'assets/images/' + picList[currentPicIndex],
                        fit: BoxFit.fill, // Consider using BoxFit
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  PageIndicatorRow(
                    currentPage: currentPicIndex,
                    indicatorCount: 4,
                    indicatorSize: 6,
                    spacing: 8,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(55, 29, 255, 0.627),
                              Color.fromRGBO(196, 12, 196, 0.627),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          width: 2, // Border width
                        ),
                        borderRadius: BorderRadius.circular(
                          7,
                        ), // Optional: rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Distribute space evenly
                                  children: [
                                    Transform.rotate(
                                      angle: math.pi +
                                          90, // 180 degrees in radians
                                      child: Image.asset(
                                        'assets/icons/icon_close.png',
                                      ),
                                    ),
                                    Text(
                                      "اللاعبين",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(
                                          196,
                                          12,
                                          196,
                                          0.627,
                                        ),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ), // Optional: Style the text
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset('assets/images/player3.png'),
                                  Image.asset('assets/images/player1.png'),
                                  Image.asset('assets/images/player2.png'),
                                ],
                              ),
                              Divider(
                                color: Color.fromRGBO(55, 29, 255, 0.627),
                              ),
                              Image.asset('assets/icons/group_arrow.png'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 400,
                    height: 262,
                    decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(55, 29, 255, 0.627),
                            Color.fromRGBO(196, 12, 196, 0.627),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        width: 2, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                        7,
                      ), // Optional: rounded corners
                    ),
                    child: ListView.builder(
                      itemCount: playersData.length,
                      itemBuilder: (context, index) {
                        return PlayerAnalysisCard(
                            playerData: playersData[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              const Positioned(
                bottom: 30, // فوق صورة الدوائر
                left: 0,
                right: 0,
                child: CustomBottomBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget _buildSquareButton(String label, VoidCallback onPressed) {
//   return SizedBox(
//     width: 77,
//     height: 73,
//     child: DecoratedBox(
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [
//             Colors.white, // Example gradient start color (Pink)
//             Color.fromARGB(
//               255,
//               184,
//               133,
//               229,
//             ), // Example gradient end color (Purple)
//           ],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         borderRadius: BorderRadius.circular(3),
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor:
//               Colors.transparent, // Make button background transparent
//           padding: EdgeInsets.zero,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
//           elevation: 0, // Remove default button elevation
//         ),
//         child: Center(
//           child: Text(
//             label,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: Color.fromRGBO(55, 29, 255, 0.627),
//               fontSize: 14,
//               fontWeight: FontWeight.w700,
//             ), // Optional: Style the text
//           ),
//         ),
//       ),
//     ),
//   );
// }

class PlayerData {
  final String name;
  final String role;
  final int age;
  final int weight;
  final double sportsDevelopment;
  final List<double> stressLevels;
  final List<double> fitnessLevels;
  final List<double> injuriesCount;

  PlayerData({
    required this.name,
    required this.role,
    required this.age,
    required this.weight,
    required this.sportsDevelopment,
    required this.stressLevels,
    required this.fitnessLevels,
    required this.injuriesCount,
  });
}

class PlayerAnalysisCard extends StatelessWidget {
  final PlayerData playerData;

  const PlayerAnalysisCard({super.key, required this.playerData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.purple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playerData.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade800,
                      ),
                    ),
                    Text(
                      playerData.role,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    SizedBox(height: 4.0),
                    Text('${playerData.age} Age',
                        style: TextStyle(color: Colors.grey.shade600)),
                    Text('${playerData.weight} KG',
                        style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 60.0,
                      height: 60.0,
                      child: CircularProgressIndicator(
                        value: playerData.sportsDevelopment,
                        strokeWidth: 6.0,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.purple),
                      ),
                    ),
                    Text(
                      '${(playerData.sportsDevelopment * 100).toInt()}%',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Sports development',
                style: TextStyle(color: Colors.grey.shade700)),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBarChart('stress', playerData.stressLevels),
                _buildBarChart('Fitness', playerData.fitnessLevels),
                _buildBarChart('Injuries', playerData.injuriesCount),
              ],
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_forward_ios,
                  color: Colors.grey.shade500, size: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(String label, List<double> values) {
    return Column(
      children: [
        SizedBox(
          height: 60.0,
          width: 40.0,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 20.0,
                height: 60.0,
                color: Colors.grey.shade200,
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                heightFactor: values[0],
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Positioned(
                bottom: 0,
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  heightFactor: values[1],
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(fontSize: 12.0, color: Colors.grey.shade600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
