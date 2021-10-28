import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:group_check/my_form_bloc.dart';
import 'package:group_check/my_radio_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<MyFormBloc>();

          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                children: [
                  BakenFormField(fieldBloc: formBloc.bakenType),
                  PredictionListFormField(fieldBloc: formBloc.predictions),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.send),
              onPressed: () => formBloc.submit(),
            ),
          );
        },
      ),
    );
  }
}

class BakenFormField extends StatelessWidget {
  final SelectFieldBloc<BakenTypeModel, String> fieldBloc;
  const BakenFormField({Key? key, required this.fieldBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFieldBloc<BakenTypeModel, String>,
        SelectFieldBlocState<BakenTypeModel, String>>(
      bloc: fieldBloc,
      builder: (context, state) {
        return Row(
          children: state.items?.map((item) {
                bool isSelected = item.dispValue == state.value?.dispValue;
                return MyRadioButton(
                  value: item.dispValue,
                  onTap: () => fieldBloc.updateValue(isSelected ? null : item),
                  isSelected: isSelected,
                );
              }).toList() ??
              [],
        );
      },
    );
  }
}

class PredictionListFormField extends StatelessWidget {
  final ListFieldBloc<SelectFieldBloc> fieldBloc;

  const PredictionListFormField({Key? key, required this.fieldBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListFieldBloc<SelectFieldBloc>,
        ListFieldBlocState<SelectFieldBloc>>(
      bloc: fieldBloc,
      builder: (context, state) {
        if (state.fieldBlocs.isEmpty) {
          return Container();
        } else {
          return ListView.builder(
            itemBuilder: (context, i) => PredictionFormField(
                predictionsIndex: i, fieldBloc: state.fieldBlocs[i]),
            shrinkWrap: true,
            itemCount: state.fieldBlocs.length,
          );
        }
      },
    );
  }
}

class PredictionFormField extends StatelessWidget {
  final int predictionsIndex;
  final SelectFieldBloc fieldBloc;
  const PredictionFormField({
    Key? key,
    required this.predictionsIndex,
    required this.fieldBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("# ${predictionsIndex + 1}着予想"),
          BlocBuilder<SelectFieldBloc, SelectFieldBlocState>(
              bloc: fieldBloc,
              builder: (context, state) => Row(
                    children: fieldBloc.state.items!.map((item) {
                      bool isSelected = fieldBloc.value == item;
                      return MyRadioButton(
                        value: "$item",
                        isSelected: isSelected,
                        onTap: () =>
                            fieldBloc.updateValue(isSelected ? null : item),
                      );
                    }).toList(),
                  )),
        ],
      ),
    );
  }
}
