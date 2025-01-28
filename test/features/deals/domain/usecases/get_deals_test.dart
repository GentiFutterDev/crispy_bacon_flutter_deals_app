import 'package:crispy_bacon_flutter_deals_app/core/error/failure.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/deal_entity.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/repositories/deals_repository.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/get_deals_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDealsRepository extends Mock implements DealsRepository {}

void main() {
  late GetDeals usecase;
  late MockDealsRepository mockDealsRepository;

  setUp(() {
    mockDealsRepository = MockDealsRepository();
    usecase = GetDeals(mockDealsRepository);
  });

  group('GetDeals Use Case', () {
    const tPage = 1;
    const tPageSize = 10;
    final tDeals = [
      Deal(
        id: '1',
        title: 'Deal 1',
        price: 9.99,
        thumbnail: 'https://example.com/deal1.png',
        rating: 4.5,
        releaseDate: DateTime(2023, 5, 10),
        metacriticLink: 'https://metacritic.com/game/1',
        isLiked: false,
      ),
      Deal(
        id: '2',
        title: 'Deal 2',
        price: 19.99,
        thumbnail: 'https://example.com/deal2.png',
        rating: 4.7,
        releaseDate: DateTime(2022, 8, 21),
        metacriticLink: 'https://metacritic.com/game/2',
        isLiked: true,
      ),
    ];

    test('should return a list of deals when the repository call is successful', () async {
      // Arrange
      when(() => mockDealsRepository.getDeals(page: tPage, pageSize: tPageSize))
          .thenAnswer((_) async => Right(tDeals));

      // Act
      final result = await usecase(page: tPage, pageSize: tPageSize);

      // Assert
      expect(result, Right(tDeals));
      verify(() => mockDealsRepository.getDeals(page: tPage, pageSize: tPageSize)).called(1);
      verifyNoMoreInteractions(mockDealsRepository);
    });

    test('should return a ServerFailure when the repository call fails', () async {
      // Arrange
      const tFailure = ServerFailure('Server error occurred');
      when(() => mockDealsRepository.getDeals(page: tPage, pageSize: tPageSize))
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await usecase(page: tPage, pageSize: tPageSize);

      // Assert
      expect(result, const Left(tFailure));
      verify(() => mockDealsRepository.getDeals(page: tPage, pageSize: tPageSize)).called(1);
      verifyNoMoreInteractions(mockDealsRepository);
    });

    test('should return a CacheFailure when no cached data is available', () async {
      // Arrange
      const tFailure = CacheFailure('No cached deals available');
      when(() => mockDealsRepository.getDeals(page: tPage, pageSize: tPageSize))
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await usecase(page: tPage, pageSize: tPageSize);

      // Assert
      expect(result, const Left(tFailure));
      verify(() => mockDealsRepository.getDeals(page: tPage, pageSize: tPageSize)).called(1);
      verifyNoMoreInteractions(mockDealsRepository);
    });
  });
}
