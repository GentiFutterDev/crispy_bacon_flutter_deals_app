// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:crispy_bacon_flutter_deals_app/core/logging/logger.dart'
    as _i504;
import 'package:crispy_bacon_flutter_deals_app/core/logging/logger_impl.dart'
    as _i691;
import 'package:crispy_bacon_flutter_deals_app/core/network/dio_client.dart'
    as _i468;
import 'package:crispy_bacon_flutter_deals_app/core/network/network_module.dart'
    as _i995;
import 'package:crispy_bacon_flutter_deals_app/features/deals/data/repositories/deals_repository_impl.dart'
    as _i583;
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/repositories/deals_repository.dart'
    as _i36;
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/get_deals_usecase.dart'
    as _i595;
import 'package:crispy_bacon_flutter_deals_app/features/deals/presentation/bloc/deals_bloc.dart'
    as _i339;
import 'package:crispy_bacon_flutter_deals_app/features/theme/data/hive_theme_repository.dart'
    as _i371;
import 'package:crispy_bacon_flutter_deals_app/features/theme/domain/theme_repository.dart'
    as _i777;
import 'package:crispy_bacon_flutter_deals_app/features/theme/presentation/theme_bloc.dart'
    as _i50;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
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
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i504.AppLogger>(() => _i691.LoggerImpl());
    gh.factory<String>(
      () => networkModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i468.DioClient>(() => _i468.DioClient(
          baseUrl: gh<String>(instanceName: 'BaseUrl'),
          logger: gh<_i504.AppLogger>(),
        ));
    gh.lazySingleton<_i777.ThemeRepository>(
        () => _i371.HiveThemeRepository(gh<_i986.Box<dynamic>>()));
    gh.factory<_i50.ThemeBloc>(
        () => _i50.ThemeBloc(gh<_i777.ThemeRepository>()));
    gh.lazySingleton<_i36.DealsRepository>(
        () => _i583.DealsRepositoryImpl(gh<_i468.DioClient>()));
    gh.factory<_i595.GetDeals>(
        () => _i595.GetDeals(gh<_i36.DealsRepository>()));
    gh.factory<_i339.DealsBloc>(() => _i339.DealsBloc(gh<_i595.GetDeals>()));
    return this;
  }
}

class _$NetworkModule extends _i995.NetworkModule {}
