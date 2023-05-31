import 'package:calendar_day_view/calendar_day_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MainApp());
}

DayEvent<String> _generateEvent(DateTime start, String text) {
  return DayEvent(
    value: text,
    start: TimeOfDay.fromDateTime(start),
    end: TimeOfDay.fromDateTime(start.add(const Duration(minutes: 30))),
  );
}

List<DayEvent<String>> _generateEvents() {
  final now = DateTime.now();

  final List<DayEvent<String>> fakeEvents = [
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4),
      'first',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour + 3),
      'second',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 2),
      'third',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4),
      'fourth',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4),
      'fifth',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4),
      'sixth',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4),
      'seventh',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4),
      'eighth',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4),
      'ninth',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 3),
      'tenth',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4, now.minute - 15),
      'eleventh',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4, now.minute - 15),
      'twelth',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4, now.minute - 30),
      'thirteenth',
    ),
    _generateEvent(
      DateTime(now.year, now.month, now.day, now.hour - 4, now.minute - 30),
      'fourteenth',
    ),
  ];

  return fakeEvents;
}

class MainApp extends HookWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final newUI = useState(false);

    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              backgroundColor: newUI.value ? Colors.green : Colors.blue,
              title: const Text('Test app'),
              pinned: true,
              actions: [
                Switch(
                  value: newUI.value,
                  onChanged: (value) {
                    print('Toggling value to $value');
                    newUI.value = value;
                  },
                )
              ],
            ),
            SliverToBoxAdapter(
              child: OverFlowCalendarDayView(
                  events: _generateEvents(),
                  primary: newUI.value,
                  startOfDay: const TimeOfDay(hour: 00, minute: 0),
                  endOfDay: const TimeOfDay(hour: 23, minute: 0),
                  timeGap: 60,
                  renderRowAsListView: true,
                  showCurrentTimeLine: true,
                  showMoreOnRowButton: true,
                  overflowItemBuilder: (context, constraints, event) =>
                      Text(event.value)),
            ),
          ],
        ),
      ),
    );
  }
}
