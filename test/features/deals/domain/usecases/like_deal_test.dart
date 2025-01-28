import 'package:crispy_bacon_flutter_deals_app/core/error/failure.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/repositories/deals_repository.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/like_deal_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDealsRepository extends Mock implements DealsRepository {}

void main() {
  late LikeDeal usecase;
  late MockDealsRepository mockDealsRepository;

  setUp(() {
    mockDealsRepository = MockDealsRepository();
    usecase = LikeDeal(mockDealsRepository);
  });

  group('LikeDeal Use Case', () {
    const tDealId = '12345';

    test('should complete successfully when the repository call succeeds', () async {
      // Arrange
      when(() => mockDealsRepository.likeDeal(tDealId))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await usecase(tDealId);

      // Assert
      expect(result, const Right(null));
      verify(() => mockDealsRepository.likeDeal(tDealId)).called(1);
      verifyNoMoreInteractions(mockDealsRepository);
    });

    test('should return CacheFailure when the repository call fails', () async {
      // Arrange
      const tFailure = CacheFailure('Failed to toggle like status');
      when(() => mockDealsRepository.likeDeal(tDealId))
          .thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await usecase(tDealId);

      // Assert
      expect(result, const Left(tFailure));
      verify(() => mockDealsRepository.likeDeal(tDealId)).called(1);
      verifyNoMoreInteractions(mockDealsRepository);
    });
  });
}
