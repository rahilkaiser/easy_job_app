import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FilterName {
  NONE,
  SALARY,
  WORK_DATE,
  CATEGORIES,
  EMPLOYER_TYPE,
  PAYMENT_TYPE,
  LOCATION,
}

class FilterSelection {
  final String title, description;
  final FilterName filterName;

  FilterSelection({
    this.title = '',
    this.description = '',
    this.filterName = FilterName.NONE,
  });
}

List filterSelectionData = [
  FilterSelection(
      title: "Gehalt",
      description: "von 1300 € bis 2500 €",
      filterName: FilterName.SALARY),
  FilterSelection(
      title: "Einsatzbeginn /-ende",
      description: "vom 04.12.2022 bis 09.09.2023",
      filterName: FilterName.WORK_DATE),
  FilterSelection(
      title: "Kategorien",
      description: "Gartenarbeit,\nSecurity.\nIT",
      filterName: FilterName.CATEGORIES),
  FilterSelection(
      title: "Auftraggebertyp",
      description: "Privatperson",
      filterName: FilterName.EMPLOYER_TYPE),
  FilterSelection(
      title: "Auszahlungsart",
      description: "Vollzeit",
      filterName: FilterName.PAYMENT_TYPE),
  FilterSelection(
      title: "Ort und Umkreis",
      description: "Bosestr. 34, 08056 Zwickau, DE, 100 km",
      filterName: FilterName.LOCATION),
];
