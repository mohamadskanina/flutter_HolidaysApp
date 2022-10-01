import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/holiday/holidaymodel.dart';
import '../../data/repository/country_code_repository.dart';

part 'holidays_cubit_state.dart';

class HolidaysCubit extends Cubit<HolidaysCubitState> {
  final CountryCodeRepository countryRepository;
  String code = "US";
  String year = "2022";
  HolidaysCubit(this.countryRepository) : super(HolidaysCubitInitial());

  getCountryHolidaysFromCubit(String code, String yaer) async {
    try {
      emit(HolidaysLoading());
      await countryRepository
          .getCountryHolidaysFromRepository(yaer, code)
          .then((listOfHolidays) {
        emit(HolidaysLoded(listOfHolidays));
      });
    } catch (_) {
      emit(HolidaysError());
    }
  }

  setCodeValue(String code) {
    this.code = code;
    getCountryHolidaysFromCubit(code, year);
  }

  setYearValue(String year) {
    this.year = year;
    getCountryHolidaysFromCubit(code, year);
  }
}
