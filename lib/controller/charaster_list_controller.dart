import 'package:get/get.dart';
import 'package:tudo_assignment/models/character_list_model.dart';
import 'package:tudo_assignment/services/list_api_services.dart';

class CharacterListController extends GetxController{
  var characterLists = <ListofCharacter>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
  }
  void fetchEvents() async {
   isLoading.value = true;
   var characters = await ApiServices.fetchEvents();
   if(characters != null){
     isLoading.value = false;
     characterLists.assignAll(characters);
   }
  }
}

