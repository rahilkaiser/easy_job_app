import 'package:easy_job_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/Suggestion.dart';
import '../../../services/place_service.dart';
import '../../../theme.dart';

class AddressSearch extends SearchDelegate<Suggestion?> {
  final sessionToken;
  late PlaceApiProvider apiClient;

  AddressSearch(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: query == ""
          ? null
          : apiClient.fetchSuggestions(
              query, Localizations.localeOf(context).languageCode),
      builder: this.buildAutocompleteSuggestions
    );
  }

  @override
  Widget buildSuggestions(
    BuildContext context,
  ) {
    return FutureBuilder(
      future: query == ""
          ? null
          : apiClient.fetchSuggestions(
              query, Localizations.localeOf(context).languageCode
      ),
      builder: buildAutocompleteSuggestions,
    );
  }

  Widget buildAutocompleteSuggestions(context, AsyncSnapshot snapshot) {
      return query == '' ? Container(
            // padding: EdgeInsets.all(16.0),
            child: Text('Enter your address'),
          )
        : snapshot.hasData
            ? ListView.builder(
                itemBuilder: (
                  context,
                  index,
                ) {
                  Suggestion sugg = snapshot.data[index] as Suggestion;
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            sugg.description,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            query = sugg.description;
                          },
                          child: Icon(
                            Icons.north_east,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      close(context, snapshot.data[index] as Suggestion);
                    },
                  );
                },
                itemCount: snapshot.data.length,
              )
            : LoadingSpinner();
    }
}

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('Geben Sie eine Adresse ein'),
      );
  }
}
