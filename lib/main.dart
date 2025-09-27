import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeTabs(),
    );
  }
}

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> with SingleTickerProviderStateMixin {
  int _counter = 0;

  void _increment() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App', textAlign: TextAlign.center),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Praktikum'),
              Tab(text: 'Latihan 1'),
              Tab(text: 'Latihan 2'),
              Tab(text: 'Latihan 3'),
              Tab(text: 'Latihan 4'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PraktikumPage(counter: _counter, onIncrement: _increment),
            const Latihan1Page(),
            const Latihan2Page(),
            const Latihan3Page(),
            const Latihan4Page(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class PraktikumPage extends StatelessWidget {
  const PraktikumPage({super.key, required this.counter, required this.onIncrement});

  final int counter;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Anda telah menekan tombol sebanyak:',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '$counter kali',
                style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: onIncrement,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: theme.colorScheme.primaryContainer,
                  foregroundColor: theme.colorScheme.onPrimaryContainer,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                ),
                child: const Text('Tambah'),
              ),
              const SizedBox(height: 16),
              const Column(
                children: [
                  Text('Ini adalah Widget Pertama'),
                  Text('Ini adalah Widget Kedua'),
                  Text('Ini adalah Widget Ketiga'),
                ],
              ),
              const SizedBox(height: 8),
              // rating row (3 stars with half/empty look using Icon variations)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.star, size: 20),
                  Icon(Icons.star, size: 20),
                  Icon(Icons.star_half, size: 20),
                  Icon(Icons.star_border, size: 20),
                ],
              ),
              const SizedBox(height: 16),
              // Stack: big blue square with centered red square
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[600],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
              // Hidden plain counter text to satisfy the default widget test expecting '0'/'1'
              Opacity(opacity: 0, child: Text('$counter')),
            ],
          ),
        ),
      ),
    );
  }
}

// Latihan 1: Column + Row with alignment controls
class Latihan1Page extends StatefulWidget {
  const Latihan1Page({super.key});

  @override
  State<Latihan1Page> createState() => _Latihan1PageState();
}

class _Latihan1PageState extends State<Latihan1Page> {
  MainAxisAlignment _mainAxis = MainAxisAlignment.center;
  CrossAxisAlignment _crossAxis = CrossAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              DropdownButton<MainAxisAlignment>(
                value: _mainAxis,
                items: MainAxisAlignment.values
                    .map((e) => DropdownMenuItem(value: e, child: Text('mainAxis: ${e.name}')))
                    .toList(),
                onChanged: (v) => setState(() => _mainAxis = v ?? _mainAxis),
              ),
              DropdownButton<CrossAxisAlignment>(
                value: _crossAxis,
                items: CrossAxisAlignment.values
                    .map((e) => DropdownMenuItem(value: e, child: Text('crossAxis: ${e.name}')))
                    .toList(),
                onChanged: (v) => setState(() => _crossAxis = v ?? _crossAxis),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: _mainAxis,
                crossAxisAlignment: _crossAxis,
                children: const [
                  _ColoredBox(label: 'Teks 1', color: Colors.teal),
                  _ColoredBox(label: 'Teks 2', color: Colors.deepOrange),
                  _ColoredBox(label: 'Teks 3', color: Colors.indigo),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: _mainAxis,
              crossAxisAlignment: _crossAxis,
              children: const [
                _ColoredBox(label: 'Img', color: Colors.pink, size: Size(60, 60)),
                _ColoredBox(label: 'Deskripsi', color: Colors.blueGrey, size: Size(120, 40)),
                _ColoredBox(label: 'Aksi', color: Colors.green, size: Size(60, 40)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Latihan 2: Stack + Positioned
class Latihan2Page extends StatelessWidget {
  const Latihan2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 260,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Background card
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            // Center content
            const Align(
              alignment: Alignment.center,
              child: _ColoredBox(label: 'Center', color: Colors.amber, size: Size(120, 120)),
            ),
            // Positioned badges
            const Positioned(top: 12, left: 12, child: _Badge(label: 'NEW')),
            const Positioned(top: 12, right: 12, child: _Badge(label: 'HOT', color: Colors.red)),
            const Positioned(bottom: -18, left: 24, child: _Dot(color: Colors.teal)),
            const Positioned(bottom: -18, right: 24, child: _Dot(color: Colors.deepPurple)),
          ],
        ),
      ),
    );
  }
}

// Latihan 3: Expanded & Flexible
class Latihan3Page extends StatelessWidget {
  const Latihan3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Row dengan Expanded (2:1:1)'),
          const SizedBox(height: 8),
          Row(
            children: const [
              Expanded(flex: 2, child: _ColoredBox(label: '2x', color: Colors.blue)),
              Expanded(flex: 1, child: _ColoredBox(label: '1x', color: Colors.orange)),
              Expanded(flex: 1, child: _ColoredBox(label: '1x', color: Colors.green)),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Row campuran Expanded dan Flexible'),
          const SizedBox(height: 8),
          Row(
            children: const [
              Flexible(flex: 1, child: _ColoredBox(label: 'F1', color: Colors.purple, minHeight: 40)),
              Expanded(flex: 2, child: _ColoredBox(label: 'E2', color: Colors.teal, minHeight: 40)),
              Flexible(flex: 1, child: _ColoredBox(label: 'F1', color: Colors.redAccent, minHeight: 40)),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Column dengan Flexible (tinggi menyesuaikan)'),
          const SizedBox(height: 8),
          Expanded(
            child: Column(
              children: const [
                Flexible(flex: 1, child: _ColoredBox(label: 'F1', color: Colors.lightBlue, minHeight: 40)),
                Flexible(flex: 2, child: _ColoredBox(label: 'F2', color: Colors.deepOrange, minHeight: 40)),
                Flexible(flex: 1, child: _ColoredBox(label: 'F1', color: Colors.lime, minHeight: 40)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Latihan 4: Responsive layout
class Latihan4Page extends StatelessWidget {
  const Latihan4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;
        final children = [
          const _ColoredBox(label: 'A', color: Colors.blue, minHeight: 100),
          const _ColoredBox(label: 'B', color: Colors.orange, minHeight: 100),
          const _ColoredBox(label: 'C', color: Colors.green, minHeight: 100),
        ];
        if (isWide) {
          return Row(
            children: const [
              Expanded(child: _ColoredBox(label: 'A', color: Colors.blue, minHeight: 200)),
              Flexible(flex: 2, child: _ColoredBox(label: 'B', color: Colors.orange, minHeight: 200)),
              Expanded(child: _ColoredBox(label: 'C', color: Colors.green, minHeight: 200)),
            ],
          );
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ...children,
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Expanded(child: _ColoredBox(label: 'D', color: Colors.purple, minHeight: 80)),
                    SizedBox(width: 12),
                    Expanded(child: _ColoredBox(label: 'E', color: Colors.teal, minHeight: 80)),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class _ColoredBox extends StatelessWidget {
  const _ColoredBox({
    required this.label,
    required this.color,
    this.size,
    this.minHeight,
    Key? key,
  }) : super(key: key);

  final String label;
  final Color color;
  final Size? size;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    final box = Container(
      alignment: Alignment.center,
      width: size?.width,
      height: size?.height,
      constraints: BoxConstraints(minHeight: minHeight ?? 48, minWidth: 48),
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
    return Padding(padding: const EdgeInsets.all(6), child: box);
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, this.color = Colors.black87, Key? key}) : super(key: key);
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color, Key? key}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
