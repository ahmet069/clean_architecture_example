import 'package:clean_architecture_example/src/core/components/text_form_field/custom_text_form_field.dart';
import 'package:clean_architecture_example/src/presentation/widget/search/search_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SearchPostWidget(),
      ),
      appBar: AppBar(
        title: CustomTextFormField(
          isReadOnly: false,
        ),
      ),
    );
  }
}
