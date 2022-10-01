import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/presentation/widget/home/customcard.dart';
import '../../../core/constant/image_assets.dart';
import '../../../data/models/holiday/holidaymodel.dart';

// ignore: must_be_immutable
class HolidaysPage extends StatefulWidget {
  List<HolidaysModel> listOfCountryModel;
  HolidaysPage({required this.listOfCountryModel, Key? key}) : super(key: key);

  @override
  State<HolidaysPage> createState() => _HolidaysPageState();
}

class _HolidaysPageState extends State<HolidaysPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: MediaQuery.of(context).size.height / 1.4,
      child: buildBlockWidget(),
    );
  }

  buildBlockWidget() {
    if (widget.listOfCountryModel.isNotEmpty) {
      return buildLoadedListWidget();
    } else {
      return Lottie.asset(AppImageAssets.nodata);
    }
  }

  buildLoadedListWidget() {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        child: buildCountryList(),
      ),
    );
  }

  Widget buildCountryList() {
    return ListView.builder(
        itemCount: widget.listOfCountryModel.length,
        itemBuilder: (context, index) =>
            CustomCard(countryModel: widget.listOfCountryModel[index]));
  }
}
