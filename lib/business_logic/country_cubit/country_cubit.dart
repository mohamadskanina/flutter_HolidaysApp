import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/country/countrycodemodel.dart';
import '../../data/repository/country_code_repository.dart';
part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountryCodeRepository countryRepository;

  CountryCubit(this.countryRepository) : super(CountryInitial());

  getCountryCodeFromModelFromCubit() async {
    try {
      emit(CountryCodeLoading());
      await countryRepository
          .getAllCountryCodeFromRepository()
          .then((countriesCode) {
        emit(CountryCodeLoded(countriesCode));
      });
    } catch (_) {
      emit(CountryCodeError());
    }
  }
}
