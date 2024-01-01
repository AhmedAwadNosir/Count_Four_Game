import 'package:count_four/features/home_feature/states_manager/controler/game_controler.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameControler>(() => GameControler());
  }
}

// this binding for load controler to memory and become ready for calling it and use it
