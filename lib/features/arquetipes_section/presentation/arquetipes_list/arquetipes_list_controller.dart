import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/use_cases/get_arquetipes_use_case.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipes_list/arquetipes_list_state.dart';

//ArquetipesListController: class to manage the state of the arquetipes list
class ArquetipesListController extends StateNotifier<ArquetipesListState> {
  ArquetipesListController(
    this.getArquetipesUseCase,
  ) : super(ArquetipesListState());
  //Define the use case
  final GetArquetipesUseCase getArquetipesUseCase;

//getArquetipes: get the arquetipes
  Future getArquetipes() async {
    final result = await getArquetipesUseCase.execute();
    result.fold((l) {
      state =
          state.copyWith(isLoading: false, arquetipes: [], auxArquetipes: []);
    }, (r) {
      state = state.copyWith(arquetipes: r, auxArquetipes: r, isLoading: false);
    });
  }

  //searchArquetipes: search an arquetipe by query
  void searchArquetipes(String query) {
    if (query.isEmpty) {
      state = state.copyWith(
        arquetipes: state.auxArquetipes,
        isSearching: false,
      );
    } else {
      final arquetipes = state.auxArquetipes.where((element) {
        return element.archetypeName
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
      state = state.copyWith(arquetipes: arquetipes, isSearching: true);
    }
  }

  //clearSearch: clear the search
  void clearSearch() {
    state = state.copyWith(
      arquetipes: state.auxArquetipes,
      isSearching: false,
    );
  }

  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}

//arquetipesListController: provider to manage the state of the arquetipes list
final arquetipesListController = StateNotifierProvider.autoDispose<
    ArquetipesListController, ArquetipesListState>((ref) {
  return ArquetipesListController(
    ref.read(getArquetipesUseCaseProvider),
  );
});
