import 'package:hive/hive.dart';
import 'package:jim_sturdy/models/exercise.dart';

part 'session.g.dart';

@HiveType(typeId: 1)
class Session extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final DateTime startTime;
  @HiveField(2)
  late DateTime endTime;
  @HiveField(3)
  late List<Exercise> exercises;

  Session({required this.name, required this.startTime}) {
    exercises = [];
  }

  void addExercise(Exercise exercise) => exercises.add(exercise);
  void setEndTime(DateTime time) => endTime = time;

  Map<String, dynamic> toJson() => {
        'name': name,
        'exercises': exercises.map((e) => e.toJson()).toList(),
      };
}
