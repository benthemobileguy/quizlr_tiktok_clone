import 'package:quizlr_tiktok_clone/core/constants/strings.dart';
import 'package:quizlr_tiktok_clone/core/failures_successes/exceptions.dart';
import 'package:quizlr_tiktok_clone/core/services/api_service.dart';
import 'package:quizlr_tiktok_clone/core/services/services_locator.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/answer.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/following.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/for_you.dart';

abstract class FetchFromRemoteDS {
  Future<Following> fetchFollowing();
  Future<ForYou> fetchForYou();
   Future<Answer> revealAnswer(String id);
}

class FetchFromRemoteDSImpl implements FetchFromRemoteDS {
  final ApiService apiService = locator<ApiService>();


  @override
  Future<Following> fetchFollowing() async {
    try {
      Map<String, dynamic> data = await apiService.fetchData(
        '${Strings.baseUrl}following',
        {},
      );
      return Following.fromJson(data);
    } catch (e) {
      throw FetchException(message: 'Error fetching data');
    }
  }

  @override
  Future<ForYou> fetchForYou() async {
    Map<String, dynamic> data = await apiService.fetchData(
      '${Strings.baseUrl}for_you',
      {},
    );
    try {
      return ForYou.fromJson(data);
    } catch (e) {
      throw FetchException(message: 'Error fetching data');
    }
  }
  
  @override
  Future<Answer> revealAnswer(String id) async{
      Map<String, dynamic> data = await apiService.fetchData(
      '${Strings.baseUrl}reveal?id=$id',
      {},
    );
    try {
      return Answer.fromJson(data);
    } catch (e) {
      throw FetchException(message: 'Error fetching data');
    }
  }
}
