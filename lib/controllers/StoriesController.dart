// import 'dart:convert';
// import 'package:bank/model/Story.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// class StoriesController extends GetxController {
//   var story = Story().obs;
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//   }
//
//   void fetchStories(int selectedStory) async {
//
//     var storiesResponce = await rootBundle.loadString("assets/json/story${selectedStory}.json");
//     story.value = Story.fromJson(json.decode(storiesResponce));
//
//   }
// }
//
//
