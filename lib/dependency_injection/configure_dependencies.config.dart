// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:crispy_bacon_flutter_deals_app/core/network/dio_client.dart'
    as _i468;
import 'package:crispy_bacon_flutter_deals_app/core/network/network_info.dart'
    as _i442;
import 'package:crispy_bacon_flutter_deals_app/core/network/network_module.dart'
    as _i995;
import 'package:crispy_bacon_flutter_deals_app/core/platform/vibration_service.dart'
    as _i782;
import 'package:crispy_bacon_flutter_deals_app/core/platform/vibration_service_impl.dart'
    as _i439;
import 'package:crispy_bacon_flutter_deals_app/core/utils/logger.dart' as _i612;
import 'package:crispy_bacon_flutter_deals_app/core/utils/logger_impl.dart'
    as _i584;
import 'package:crispy_bacon_flutter_deals_app/features/deals/data/datasources/deals_local_data_source.dart'
    as _i860;
import 'package:crispy_bacon_flutter_deals_app/features/deals/data/datasources/deals_local_data_source_impl.dart'
    as _i126;
import 'package:crispy_bacon_flutter_deals_app/features/deals/data/repositories/deals_repository_impl.dart'
    as _i583;
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/repositories/deals_repository.dart'
    as _i36;
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/get_deals_usecase.dart'
    as _i595;
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/is_deal_liked_usecase.dart'
    as _i1016;
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/like_deal_usecase.dart'
    as _i676;
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/bloc/deals_bloc.dart'
    as _i339;
import 'package:crispy_bacon_flutter_deals_app/features/theme/data/theme_repository_impl.dart'
    as _i553;
import 'package:crispy_bacon_flutter_deals_app/features/theme/domain/theme_repository.dart'
    as _i777;
import 'package:crispy_bacon_flutter_deals_app/features/theme/presentation/theme_bloc.dart'
    as _i50;
import 'package:crispy_bacon_flutter_deals_app/infrastructure/database/app_database.dart'
    as _i23;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i895.Connectivity>(() => coreModule.connectivity);
    gh.lazySingleton<_i23.AppDatabase>(() => _i23.AppDatabase());
    gh.factory<String>(
      () => networkModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i782.VibrationService>(
        () => _i439.VibrationServiceImpl());
    gh.lazySingleton<_i442.NetworkInfo>(
        () => _i442.NetworkInfoImpl(gh<_i895.Connectivity>()));
    gh.lazySingleton<_i612.AppLogger>(() => _i584.LoggerImpl());
    gh.lazySingleton<_i860.DealsLocalDataSource>(
        () => _i126.DealsLocalDataSourceImpl(gh<_i23.AppDatabase>()));
    gh.lazySingleton<_i777.ThemeRepository>(
        () => _i553.ThemeRepositoryImpl(gh<_i23.AppDatabase>()));
    gh.factory<_i50.ThemeBloc>(
        () => _i50.ThemeBloc(gh<_i777.ThemeRepository>()));
    gh.lazySingleton<_i468.DioClient>(() => _i468.DioClient(
          baseUrl: gh<String>(instanceName: 'BaseUrl'),
          logger: gh<_i612.AppLogger>(),
        ));
    gh.lazySingleton<_i36.DealsRepository>(() => _i583.DealsRepositoryImpl(
          dioClient: gh<_i468.DioClient>(),
          logger: gh<_i612.AppLogger>(),
          localDataSource: gh<_i860.DealsLocalDataSource>(),
          networkInfo: gh<_i442.NetworkInfo>(),
        ));
    gh.factory<_i595.GetDeals>(
        () => _i595.GetDeals(gh<_i36.DealsRepository>()));
    gh.factory<_i1016.IsDealLiked>(
        () => _i1016.IsDealLiked(gh<_i36.DealsRepository>()));
    gh.factory<_i676.LikeDeal>(
        () => _i676.LikeDeal(gh<_i36.DealsRepository>()));
    gh.factory<_i339.DealsBloc>(() => _i339.DealsBloc(
          gh<_i595.GetDeals>(),
          gh<_i676.LikeDeal>(),
          gh<_i1016.IsDealLiked>(),
        ));
    return this;
  }
}

class _$CoreModule extends _i442.CoreModule {}

class _$NetworkModule extends _i995.NetworkModule {}
