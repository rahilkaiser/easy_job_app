// ignore_for_file: unnecessary_new

import 'package:easy_job_app/constants.dart';
import 'package:easy_job_app/theme.dart';
import 'package:flutter/material.dart';

import '../../components/floating_found_result_button.dart';
import '../../models/FilterSelection.dart';
import 'modals/categories_modal.dart';
import 'modals/employer_type_modal.dart';
import 'modals/location_modal.dart';
import 'modals/payment_type_modal.dart';
import 'modals/salary_modal.dart';
import 'modals/work_date_modal.dart';

class FilterScreen extends StatelessWidget {
  static String routeName = "/filter";
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appBarThemeSearch(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Suche",
            style: TextStyle(
              color: kTextColor,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        floatingActionButton: FloatingFoundResultButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: filterSelectionData.length,
                itemBuilder: (context, index) => FilterSelectionCard(
                  filterSelection: filterSelectionData[index],
                  press: () {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context) => _buildPopupDialog(
                          context, filterSelectionData[index].filterName),
                    );
                  },
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 1,
                    color: Colors.black45,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    //LISTE --> JEweils Modal öffnet sich

    // Gehalt von bis
    // Einsatzbeginn
    // Einsatzende
    // Einsatzdauer
    // Einsatzort
    // Vollzeit oder Pauschal
    // privat oder Firma
  }

  Widget _buildPopupDialog(BuildContext context, FilterName filterName) {
    switch (filterName) {
      case FilterName.SALARY:
        return SalaryModal();
      case FilterName.WORK_DATE:
        return WorkDateModal();
      case FilterName.CATEGORIES:
        return CategoriesModal();
      case FilterName.EMPLOYER_TYPE:
        return EmployerTypeModal();
      case FilterName.PAYMENT_TYPE:
        return PaymentTypeModal();
      case FilterName.LOCATION:
        return LocationModal();
      default:
        return AlertDialog(
          title: const Text('No Dialog'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text("Hello"),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
    }
  }
}

class FilterSelectionCard extends StatelessWidget {
  FilterSelectionCard({
    Key? key,
    required this.press,
    required this.filterSelection,
  }) : super(key: key);

  final VoidCallback press;
  FilterSelection filterSelection;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.4),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    filterSelection.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      filterSelection.description,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
