import 'package:hive/hive.dart';
import 'package:jim_sturdy/models/exercise_set.dart';

part 'exercise.g.dart';

@HiveType(typeId: 2)
class Exercise extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  late List<ExerciseSet> sets;

  Exercise({required this.id, required this.name}) {
    sets = [];
  }

  void addSet(ExerciseSet exerciseSet) => sets.add(exerciseSet);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'sets': sets.map((e) => e.toJson()).toList()};
}
