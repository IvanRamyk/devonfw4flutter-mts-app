import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_thai_star_flutter/blocs/current_search_bloc.dart';
import 'package:my_thai_star_flutter/blocs/current_search_events.dart';
import 'package:my_thai_star_flutter/models/search.dart';

import '../../ui_helper.dart';

class SliverSearchHeader extends StatelessWidget {
  static const double height = 120;

  const SliverSearchHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: UiHelper.elevation,
      floating: true,
      backgroundColor: Colors.white,
      leading: Container(),
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
          child: BlocBuilder<CurrentSearchBloc, Search>(
            builder: (context, state) => Column(
              children: <Widget>[
                _SearchBar(state: state),
                _Sort(state: state),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final Search state;
  const _SearchBar({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search),
        labelText: "Search our Dishes",
      ),
      onChanged: (String query) => BlocProvider.of<CurrentSearchBloc>(context)
          .dispatch(SetQueryEvent(query)),
    );
  }
}

class _Sort extends StatelessWidget {
  static const double iconPadding = 12.0;
  static const double dropDownPadding = 5;

  final Search state;

  const _Sort({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(iconPadding),
          child: Icon(
            Icons.sort,
            color: Colors.grey,
          ),
        ),
        Text(
          "Sort by",
          style: Theme.of(context).textTheme.subhead,
        ),
        SizedBox(
          width: dropDownPadding,
        ),
        Expanded(
          child: DropdownButton<String>(
            isExpanded: true,
            value: state.sortBy,
            items: Search.sortCriteria.map(
              (String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              },
            ).toList(),
            onChanged: (String sortBy) =>
                BlocProvider.of<CurrentSearchBloc>(context)
                    .dispatch(SetSortEvent(sortBy)),
          ),
        ),
        IconButton(
          icon: Icon(
            state.descending
                ? Icons.vertical_align_bottom
                : Icons.vertical_align_top,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () => BlocProvider.of<CurrentSearchBloc>(context)
              .dispatch(FlipDirectionEvent()),
        ),
      ],
    );
  }
}

