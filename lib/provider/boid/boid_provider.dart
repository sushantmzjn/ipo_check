import 'package:firebase_auth/main.dart';
import 'package:firebase_auth/models/boid/boid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

final boidAddProvider = StateNotifierProvider<BoidProvider, List<Boid>>(
    (ref) => BoidProvider(ref.watch(box)));

class BoidProvider extends StateNotifier<List<Boid>> {
  BoidProvider(super.state);

  //--------add biod--------
  String add(Boid boid) {
    final newBoid = Boid(
      name: boid.name,
      boidNumber: boid.boidNumber,
    );
    final box = Hive.box<Boid>('boidBox').add(newBoid);
    state = [...state, newBoid];
    return 'added';
  }

  //--------delete biod--------
  String delete(Boid deleteBoid) {
    deleteBoid.delete();
    state.remove(deleteBoid);
    state = state.where((task) => task != deleteBoid).toList();
    // state = [...state];
    return 'deleted';
  }

  //--------edit biod--------
  String update(int index, Boid updateBoids) {
    state[index] = updateBoids;
    final updateBoid = Boid(
      name: updateBoids.name,
      boidNumber: updateBoids.boidNumber,
    );
    final box = Hive.box<Boid>('boidBox').putAt(index, updateBoid);
    state = List.from(state)..[index] = updateBoid;
    // state = [...state];
    return 'updated';
  }
}
