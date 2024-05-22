import 'package:taller_29_mayo_front/app/model/task.dart';
import 'package:taller_29_mayo_front/app/repository/http_client.dart';
import 'package:taller_29_mayo_front/app/repository/shared_preference_client.dart';

class TaskServices {
  static Future<HttpResponse> getTasks() async {
    String accessToken = await SharedPreferenceClient.getString('access_token');
    return await HttpClient.get('tasks', accessToken: accessToken);
  }

  static Future<HttpResponse> addTask(Task task) async {
    String accessToken = await SharedPreferenceClient.getString('access_token');
    return await HttpClient.post(
      'tasks',
      task.toJson(),
      accessToken: accessToken,
    );
  }

  static Future<HttpResponse> modTask(Task task) async {
    String accessToken = await SharedPreferenceClient.getString('access_token');
    return await HttpClient.put(
      'tasks/${task.uuidTask}',
      task.toJson(),
      accessToken: accessToken,
    );
  }

  static Future<HttpResponse> deleteTask(String uuidTask) async {
    String accessToken = await SharedPreferenceClient.getString('access_token');
    return await HttpClient.delete(
      'tasks/$uuidTask',
      null,
      accessToken: accessToken,
    );
  }
}
