import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_job_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  final _createJobFormKey = GlobalKey<FormState>();

  //Kategorien --> Enum?
  //Einsatzort --> Addresse
  //Einsatzbeginn --> ab sofort == DateTime.now() oder Datum
  //Einsatzende --> DateTime || Enum
  //Auszahlungsart --> isPerHour
  //Gehalt --> float

  FocusNode _titleFocusNode = new FocusNode();

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
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: kPrimaryColor),
        child: Container(
          padding: EdgeInsets.all(
            kDefaultPadding,
          ),
          child: Form(
            key: _createJobFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  focusNode: this._titleFocusNode,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    labelText: "Titel",
                    labelStyle: TextStyle(color: kTextColor),
                    helperText: "Gib hier einen Titel ein (min. 10 Zeichen)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  key: _createJobFormKey,
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownSearch<String>(
                  validator: (v) => v == null ? "required field" : null,

                  dropdownSearchDecoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    labelText: "Kategorie",
                    labelStyle: TextStyle(color: kTextColor),
                    helperText: 'Wähle eine Kategorie aus.',
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  mode: Mode.BOTTOM_SHEET,
                  showSelectedItems: true,
                  items: const [
                    "Weitere Jobs",
                    "Bau, Handwerk & Produktion",
                    "Arbeit mit Tieren",
                    "Büroarbeit & Verwaltung",
                    'Gastronomie & Tourismus',
                    "Kundenservice & Call Center",
                    "Mini- & Nebenjobs",
                    "Soziale Dienstleistungen & Pflege",
                    "Sicherheit",
                    "Transport, Logistik & Verkehr",
                    "Vertrieb, Einkauf & Verkauf",
                    "Informationstechnik",
                    "Grafik/Design",
                    "Haushaltshilfe",
                    "Reinigung & Pflege",
                  ],
                  onChanged: print,
                   popupTitle: Text("Kategorien", style: TextStyle(fontSize: 19),),
                  // popupItemBuilder: ,
                  // positionCallback: (popupButtonObject, overlay) {
                  //   final decorationBox = _findBorderBox(popupButtonObject);
                  //
                  //   double translateOffset = 0;
                  //   if (decorationBox != null) {
                  //     translateOffset = decorationBox.size.height -
                  //         popupButtonObject.size.height;
                  //   }
                  //
                  //   // Get the render object of the overlay used in `Navigator` / `MaterialApp`, i.e. screen size reference
                  //   final RenderBox overlay = Overlay.of(context)!
                  //       .context
                  //       .findRenderObject() as RenderBox;
                  //   // Calculate the show-up area for the dropdown using button's size & position based on the `overlay` used as the coordinate space.
                  //   return RelativeRect.fromSize(
                  //     Rect.fromPoints(
                  //       popupButtonObject
                  //           .localToGlobal(
                  //               popupButtonObject.size.bottomLeft(Offset.zero),
                  //               ancestor: overlay)
                  //           .translate(0, translateOffset),
                  //       popupButtonObject.localToGlobal(
                  //           popupButtonObject.size.bottomRight(Offset.zero),
                  //           ancestor: overlay),
                  //     ),
                  //     Size(overlay.size.width, overlay.size.height),
                  //   );
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
