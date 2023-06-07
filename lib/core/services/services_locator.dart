import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quizlr_tiktok_clone/core/services/api_service.dart';
import 'package:quizlr_tiktok_clone/features/home/data/data_sources/fetch_from_remote_ds.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/repositories/fetch_repo_contract.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/usecases/fetch_following.dart';
import 'package:quizlr_tiktok_clone/features/home/data/repositories/fetch_repo_impl.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/usecases/fetch_for_you.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/usecases/reveal_answer.dart';

final GetIt locator = GetIt.instance;

void setUpServicesLocator() {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<ApiService>(ApiServiceImpl());
  locator.registerSingleton<FetchFromRemoteDS>(FetchFromRemoteDSImpl());
  locator.registerSingleton<FetchRepo>(FetchRepoImpl());
  locator.registerSingleton<FetchFollowingUseCase>(FetchFollowingUseCase());
  locator.registerSingleton<FetchForYouUseCase>(FetchForYouUseCase());
  locator.registerSingleton<FetchRevealAnswerUseCase>(FetchRevealAnswerUseCase());
}
