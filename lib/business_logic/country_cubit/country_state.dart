part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

//Country State is Load
class CountryCodeLoded extends CountryState {
  final List<CountriesCodeModel> listOfCountryCodeModel;
  CountryCodeLoded(this.listOfCountryCodeModel);
}

//Country Loading State
class CountryCodeLoading extends CountryState {}

//Country Loading is Empty
class CountryCodeError extends CountryState {
  // final List<CountriesCodeModel> listOfCountryCodeModel;

}

class CountryCodeEmpty extends CountryState {
  // final List<CountriesCodeModel> listOfCountryCodeModel;

}
