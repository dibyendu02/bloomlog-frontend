import 'package:bloomlog/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text("Insights"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.go('/daily-log'),
            tooltip: 'Add New Entry',
          ),
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Quick actions
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/daily-log'),
                  icon: const Icon(Icons.add),
                  label: const Text('New Entry'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Export feature coming soon!'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.download),
                  label: const Text('Export'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          const Text(
            'Reflections',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage('assets/images/reflection_placeholder.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your journey of self-discovery\ncontinues...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Trends',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          const Text(
            'Mood Trends',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          const Text(
            '7.2',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Last 7 Days · +12%',
            style: TextStyle(color: Colors.green),
          ),
          const SizedBox(height: 12),

          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.teal,
                    barWidth: 3,
                    belowBarData: BarAreaData(show: false),
                    spots: const [
                      FlSpot(0, 6),
                      FlSpot(1, 6.5),
                      FlSpot(2, 7),
                      FlSpot(3, 6.2),
                      FlSpot(4, 6.9),
                      FlSpot(5, 7.4),
                      FlSpot(6, 7),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Mon"),
              Text("Tue"),
              Text("Wed"),
              Text("Thu"),
              Text("Fri"),
              Text("Sat"),
              Text("Sun"),
            ],
          ),

          const SizedBox(height: 24),
          const Text(
            'Mood Graph',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          const Text(
            'Mood Distribution',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          const Text(
            '6.8',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Text('Last 30 Days · -5%', style: TextStyle(color: Colors.red)),
          const SizedBox(height: 12),

          SizedBox(
            height: 150,
            child: BarChart(
              BarChartData(
                gridData: FlGridData(show: false),
                alignment: BarChartAlignment.spaceAround,
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(show: false),
                barGroups: List.generate(7, (index) {
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: 5 + (index % 3).toDouble(),
                        color: Colors.teal,
                        width: 16,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),

          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
              Text("6"),
              Text("7"),
            ],
          ),

          const SizedBox(height: 24),

          // Summary card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Summary',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Your mood has been trending upward this week\n'
                    '• Most productive days: Wednesday & Friday\n'
                    '• Consider adding more entries for better insights',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => context.go('/daily-log'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Add Today\'s Entry'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
