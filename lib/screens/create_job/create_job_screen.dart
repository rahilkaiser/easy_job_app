import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_job_app/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

class CreateJobScreen extends StatefulWidget {
  static String routeName = "/create";

  const CreateJobScreen({Key? key}) : super(key: key);

  @override
  State<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  int _activeStepIndex = 0;

  //Titel
  //Kategorie
  //Beschreibung
  //Einsatzort --> Adresse
  //Einsatzbeginn --> ab sofort || Einsatzende --> Datum/ Vollzeit/ Teilzeit
  //Gehalt und Auszahlungsart --> Pro Stunde || pauschal

  TextEditingController title = TextEditingController();
  TextEditingController descr = TextEditingController();
  TextEditingController cateController =
      TextEditingController(text: "Security -> Objectschutz");

  TextEditingController beginDateController =
      TextEditingController(text: "ab heute");
  TextEditingController timeRangeController = TextEditingController();

  bool beginDateSelected = false;
  bool endDateSelected = false;

  late DateTime? beginDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
  }

  //Kategorien --> Enum?
  //Einsatzort --> Addresse
  //Einsatzbeginn --> ab sofort == DateTime.now() oder Datum
  //Einsatzende --> DateTime || Enum
  //Auszahlungsart --> isPerHour
  //Gehalt --> float

  FocusNode _titleFocusNode = new FocusNode();
  FocusNode _beginFocusNode = new FocusNode();
  FocusNode _endFocusNode = new FocusNode();

  RenderBox? _findBorderBox(RenderBox box) {
    RenderBox? borderBox;

    box.visitChildren((child) {
      if (child is RenderCustomPaint) {
        borderBox = child;
      }

      final box = _findBorderBox(child as RenderBox);
      if (box != null) {
        borderBox = box;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: kPrimaryColor,
            ),
            onPressed: () {},
            child: Text(
              "Vorschau",
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
        title: Text(
          "Auftrag erstellen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(
          kDefaultPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  labelText: "Titel",
                  labelStyle: TextStyle(color: kTextColor),
                  helperText: "Gebe hier einen Titel ein (min. 10 Zeichen)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: cateController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Kategorie",
                  labelStyle: TextStyle(color: kTextColor),
                  helperText: "Gebe hier einen Titel ein (min. 10 Zeichen)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              // DropdownSearch<String>(
              //   validator: (v) => v == null ? "required field" : null,
              //   dropdownSearchDecoration: InputDecoration(
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: kPrimaryColor),
              //     ),
              //     labelText: "Kategorie",
              //     labelStyle: TextStyle(color: kTextColor),
              //     helperText: 'Wähle eine Kategorie aus.',
              //     contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //   ),
              //   mode: Mode.DIALOG,
              //   showSelectedItems: true,
              //   items: const [
              //     "Sonstiges",
              //     "Bau, Handwerk & Produktion",
              //     "Arbeit mit Tieren",
              //     "Büroarbeit & Verwaltung",
              //     'Gastronomie & Tourismus',
              //     "Kundenservice & Call Center",
              //     "Mini- & Nebenjobs",
              //     "Soziale Dienstleistungen & Pflege",
              //     "Sicherheit",
              //     "Transport, Logistik & Verkehr",
              //     "Vertrieb, Einkauf & Verkauf",
              //     "Informationstechnik",
              //     "Grafik/Design",
              //     "Haushaltshilfe",
              //     "Reinigung & Pflege",
              //   ],
              //   onChanged: print,
              //   popupTitle: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text(
              //       "Kategorien",
              //       style: TextStyle(fontSize: 19),
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: this.beginDateController,
                      onTap: () async {
                        DateTime? beginDate = await showDatePicker(
                          locale: Locale("de"),
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2300),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: kPrimaryColor,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    primary: kPrimaryColor, // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );

                        if (beginDate == null) return;

                        this.beginDate = beginDate;

                        setState(() {
                          DateTime? dt = DateTime.now();
                          if (this.beginDate!.day == dt.day &&
                              this.beginDate!.month == dt.month &&
                              this.beginDate!.year == dt.year) {
                            this.beginDateController.text = 'ab heute';
                            return;
                          }
                          this.beginDateController.text =
                              '${this.beginDate!.day}.${this.beginDate!.month}.${this.beginDate!.year}';
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        labelText: "Datum",
                        labelStyle: TextStyle(color: kTextColor),
                        helperText: "Einsatzbeginn",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      controller: this.timeRangeController,
                      onTap: () => TimeRangePicker.show(
                        okLabel: "Bestätigen",
                        cancelLabel: "Abbrechen",
                        context: context,
                        unSelectedEmpty: true,
                        startTime: TimeOfDay(
                            hour: _startTime.hour, minute: _startTime.minute),
                        endTime: TimeOfDay(
                            hour: _endTime.hour, minute: _endTime.minute),
                        onSubmitted: (TimeRangeValue value) {
                          setState(() {
                            _startTime = value.startTime!;
                            _endTime = value.endTime!;
                          });
                        },
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        labelText: "Zeitfenster",
                        labelStyle: TextStyle(color: kTextColor),
                        helperText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Auszahlungsart",
                  labelStyle: TextStyle(color: kTextColor),
                  helperText: "pauschal oder pro Stunde",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.euro_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  labelText: "Gehalt",
                  labelStyle: TextStyle(color: kTextColor),
                  helperText: "Lege ein Gehalt fest.",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              ),
              Container(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Auftrag erstellen",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Be
//
