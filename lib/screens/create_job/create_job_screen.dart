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

  bool shiftStartDateTimeSelected = false;
  DateTime shiftStartDateTime = DateTime.now();
  late DateTime untilDate;

  @override
  void initState() {
    super.initState();

    untilDate = DateTime(shiftStartDateTime.year + 10);
  }

  TextEditingController title = TextEditingController(text: "");
  TextEditingController descr = TextEditingController();

  TextEditingController category =
      TextEditingController(text: "Sicherheit -> Objektschutz");

  TextEditingController adress = TextEditingController();

  final _createJobFormKey = GlobalKey<FormState>();

  FocusNode _titleFocusNode = new FocusNode();
  FocusNode _categoryFocusNode = new FocusNode();
  FocusNode _adressFocusNode = new FocusNode();

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
        data: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: kPrimaryColor,
              ),
        ),
        child: Container(
          padding: EdgeInsets.all(
            kDefaultPadding,
          ),
          child: Form(
            key: _createJobFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleInputField(
                    title: title,
                    titleFocusNode: _titleFocusNode,
                    createJobFormKey: _createJobFormKey),
                SizedBox(
                  height: 20,
                ),
                CategoriesField(
                    category: category, categoryFocusNode: _categoryFocusNode),
                SizedBox(
                  height: 20,
                ),

                WorkLocationTextField(
                    adress: adress, adressFocusNode: _adressFocusNode),
                SizedBox(
                  height: 20,
                ),
                //Kategorien --> Enum?
                //Einsatzort --> Addresse
                //Einsatzbeginn --> ab sofort == DateTime.now() oder Datum
                //Einsatzende --> DateTime || Enum
                //Auszahlungsart --> isPerHour
                //Gehalt --> float


              ],
            ),
          ),
        ),
      ),
    );
  }


}

class WorkLocationTextField extends StatelessWidget {
  const WorkLocationTextField({
    Key? key,
    required this.adress,
    required FocusNode adressFocusNode,
  })  : _adressFocusNode = adressFocusNode,
        super(key: key);

  final TextEditingController adress;
  final FocusNode _adressFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: adress,
      focusNode: this._adressFocusNode,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.location_on_outlined),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        labelText: "Einsatzort",
        labelStyle: TextStyle(color: kTextColor),
        helperText: "Gib hier die Adresse des Einsatzortes ein",
        helperStyle: hintSearchTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class CategoriesField extends StatelessWidget {
  const CategoriesField({
    Key? key,
    required this.category,
    required FocusNode categoryFocusNode,
  })  : _categoryFocusNode = categoryFocusNode,
        super(key: key);

  final TextEditingController category;
  final FocusNode _categoryFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: category,
      focusNode: this._categoryFocusNode,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.arrow_drop_down),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        labelText: "Kategorie",
        labelStyle: TextStyle(color: kTextColor),
        helperText: "Wähle eine zutreffende Kategorie aus",
        helperStyle: hintSearchTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class TitleInputField extends StatelessWidget {
  const TitleInputField({
    Key? key,
    required this.title,
    required FocusNode titleFocusNode,
    required GlobalKey<FormState> createJobFormKey,
  })  : _titleFocusNode = titleFocusNode,
        _createJobFormKey = createJobFormKey,
        super(key: key);

  final TextEditingController title;
  final FocusNode _titleFocusNode;
  final GlobalKey<FormState> _createJobFormKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: title,
      focusNode: this._titleFocusNode,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        labelText: "Titel",
        labelStyle: TextStyle(color: kTextColor),
        helperText: "Gib hier einen Titel ein (min. 10 Zeichen)",
        helperStyle: hintSearchTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      key: _createJobFormKey,
    );
  }
}

// Stack(
//   clipBehavior: Clip.none,
//   children: [
//     Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: kTextColor),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: TextField(
//         textAlign: TextAlign.center,
//         autofocus: true,
//         enabled: false,
//         decoration: InputDecoration(
//           label: Center(
//             child: Text("Kategorie"),
//           ),
//           labelStyle: TextStyle(color: kPrimaryColor),
//         ),
//       ),
//     ),
//     Positioned(
//       top: -10,
//       left: 9,
//       child: Container(
//         color: Colors.white,
//         child: Text(
//           "Kategorie",
//           style: TextStyle(
//             fontSize: 12,
//             color: kPrimaryColor,
//           ),
//         ),
//       ),
//     ),
//   ],
// ),

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

//
// DropdownSearch<String>(
// validator: (v) => v == null ? "required field" : null,
// dropdownSearchDecoration: InputDecoration(
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: kPrimaryColor),
// ),
// label: Container(
// child: Text("Kategorie"),
// ),
// helperText: 'Wähle eine zutfreffende Kategorie aus',
// helperStyle: hintSearchTextStyle,
// contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(5),
// ),
// ),
// mode: Mode.BOTTOM_SHEET,
// showAsSuffixIcons: false,
// showClearButton: true,
// maxHeight: MediaQuery.of(context).size.height - 80,
// showSelectedItems: true,
// items: const [
// "Sonstige",
// "Bau, Handwerk & Produktion",
// "Arbeit mit Tieren",
// "Büroarbeit & Verwaltung",
// 'Gastronomie & Tourismus',
// "Kundenservice & Call Center",
// "Mini- & Nebenjobs",
// "Soziale Dienstleistungen & Pflege",
// "Sicherheit",
// "Transport, Logistik & Verkehr",
// "Vertrieb, Einkauf & Verkauf",
// "Informationstechnik",
// "Grafik/Design",
// "Haushaltshilfe",
// "Reinigung & Pflege",
// ],
// onChanged: print,
// popupTitle: Container(
// padding: EdgeInsets.all(10),
// child: Text(
// "Kategorien",
// style: TextStyle(fontSize: 19),
// ),
// ),
// ),
