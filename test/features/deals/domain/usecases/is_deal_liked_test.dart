import 'package:crispy_bacon_flutter_deals_app/core/error/failure.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/repositories/deals_repository.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/is_deal_liked_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDealsRepository extends Mock implements DealsRepository {}

void main() {
  late IsDealLiked usecase;
  late MockDealsRepository mockDealsRepository;

  setUp(() {
    mockDealsRepository = MockDealsRepository();
    usecase = IsDealLiked(mockDealsRepository);
  });

  group('IsDealLiked Use Case', () {
    const tDealId = '12345';

    test('should return true when the deal is liked', () async {
      // Arrange
      when(() => mockDealsRepository.isDealLiked(tDealId))
          .thenAnswer((_) async => const Right(true));

      // Act
      final result = await usecase(tDealId);

      // Assert
      expect(result, const Right(true));
      verify(() => mockDealsRepository.isDealLiked(tDealId)).called(1);
      verifyNoMoreInteractions(mockDealsRepository);
    });

    test('should return false when the deal is not liked', () async {
      // Arrange
      when(() => mockDealsRepository.isDealLiked(tDealId))
          .thenAnswer((_) async => const Right(false));

      // Act
      final result = await usecase(tDealId);

      // Assert
      expect(result, const Right(false));
      verify(() => mockDealsRepository.isDealLiked(tDealId)).called(1);
      verifyNoMoreInteractions(mockDealsRepository);
    });

    test('should return CacheFailure when there is an error', () async {
      // Arrange
      const tFailure = CacheFailure('Failed to check like status');
      when(() => mockDealsRepository.isDealLiked(tDealId))
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await usecase(tDealId);

      // Assert
      expect(result, const Left(tFailure));
      verify(() => mockDealsRepository.isDealLiked(tDealId)).called(1);
      verifyNoMoreInteractions(mockDealsRepository);
    });
  });
}
