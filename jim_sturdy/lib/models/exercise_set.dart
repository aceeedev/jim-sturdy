import 'package:hive/hive.dart';

part 'exercise_set.g.dart';

@HiveType(typeId: 3)
class ExerciseSet extends HiveObject {
  @HiveField(0)
  late double? reps;
  @HiveField(1)
  late dynamic measurement;
  @HiveField(2)
  late String? measurementType;

  ExerciseSet({this.reps, this.measurement, this.measurementType});

  void edit(
      {double? newReps, dynamic mewMeasurement, String? newMeasurementType}) {
    if (newReps != null) reps = newReps;
    if (mewMeasurement != null) measurement = mewMeasurement;
    if (newMeasurementType != null) measurementType = newMeasurementType;
  }

  Map<String, dynamic> toJson() => {
        'reps': reps,
        'measurement': measurement,
        'measurement type': measurementType,
      };
}
