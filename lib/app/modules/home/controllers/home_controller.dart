import 'package:boiler_plate_getx/app/data/model/index.dart';
import 'package:boiler_plate_getx/app/data/repository/auth_repository.dart';
import 'package:boiler_plate_getx/app/data/repository/pokemon_repository.dart';
import 'package:boiler_plate_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with ScrollMixin {
  final _repository = Get.find<PokemonRepository>();
  final _localStorage = Get.find<AuthRepository>();

  List<ResponsePokemonResult> listDataPokemon = [];
  String token = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getData();
    getLocalData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getData() async {
    var result = await _repository.getPokemon();
    listDataPokemon = result.results ?? [];
    update();
  }

  void getLocalData() async {
    token = await _localStorage.getToken() ?? '';
    update();
  }

  void onTapLogout() async {
    await _localStorage.clearToken();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  Future<void> onEndScroll() async {
    print("on bottom position");
  }

  @override
  Future<void> onTopScroll() async {
    print("on top position");
  }
}
