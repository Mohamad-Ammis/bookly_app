import 'package:bookly_app/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        BlocProvider.of<SearchCubit>(context)
            .searchBooksWithName(searchText: value);
      },
      decoration: InputDecoration(
          hintText: "Seach here..",
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Opacity(
                  opacity: .8, child: Icon(FontAwesomeIcons.magnifyingGlass))),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder()),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white, width: .1),
    );
  }
}
