import 'package:flutter/material.dart';

class PageIndicatorRow extends StatelessWidget {
  const PageIndicatorRow({
    super.key,
    required this.currentPage,
    required this.indicatorCount,
    this.indicatorSize = 12.0,
    this.spacing = 16.0,
    this.inactiveColor = Colors.white,
    this.activeColor = const Color.fromRGBO(196, 12, 196, 0.8),
  });

  final int currentPage;
  final int indicatorCount;
  final double indicatorSize;
  final double spacing;
  final Color inactiveColor;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(indicatorCount, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: Container(
            width: indicatorSize * 2.5, // Adjust width for the rounded shape
            height: indicatorSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(indicatorSize / 2),
              color: index == currentPage ? activeColor : inactiveColor,
            ),
          ),
        );
      }),
    );
  }
}

// Example usage within your OnBoardingOneView or another widget:
class OnBoardingOneView extends StatefulWidget {
  const OnBoardingOneView({super.key});

  @override
  State<OnBoardingOneView> createState() => _OnBoardingOneViewState();
}

class _OnBoardingOneViewState extends State<OnBoardingOneView> {
  int _currentPage = 1; // Example current page index (0-based)
  final int _indicatorCount = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Indicators')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your other content here
            const SizedBox(height: 40),
            PageIndicatorRow(
              currentPage: _currentPage,
              indicatorCount: _indicatorCount,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Previous',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Next',
          ),
        ],
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            if (index == 0 && _currentPage > 0) {
              _currentPage--;
            } else if (index == 1 && _currentPage < _indicatorCount - 1) {
              _currentPage++;
            }
          });
        },
      ),
    );
  }
}
