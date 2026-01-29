import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final _supabase = Supabase.instance.client;

  var notes = [].obs;
  var todo = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      final responses = await Future.wait([
        _supabase.from('notes').select().order('created_at', ascending: false),
        _supabase.from('todos').select().order('created_at', ascending: true),
      ]);
      notes.value = responses[0];
      todo.value = responses[1];
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> toggleTodo(int id, bool currentStatus) async {
    await _supabase
        .from('todos')
        .update({'is_done': !currentStatus})
        .eq('id', id);
    fetchData();
  }
}
