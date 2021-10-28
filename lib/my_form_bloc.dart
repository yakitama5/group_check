import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class MyFormBloc extends FormBloc<String, String> {
  final bakenType = SelectFieldBloc<BakenTypeModel, String>(
    validators: [FieldBlocValidators.required],
    items: [
      const BakenTypeModel(dispValue: '単勝', predictionNum: 1),
      const BakenTypeModel(dispValue: '複勝', predictionNum: 1),
      const BakenTypeModel(dispValue: '枠連', predictionNum: 1),
      const BakenTypeModel(dispValue: '馬連', predictionNum: 1),
      const BakenTypeModel(dispValue: '馬単', predictionNum: 1),
      const BakenTypeModel(dispValue: '3連複', predictionNum: 3),
      const BakenTypeModel(dispValue: '3連単', predictionNum: 3),
    ],
  );

  final predictions = ListFieldBloc<SelectFieldBloc>(name: 'predictions');

  MyFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        bakenType,
        predictions,
      ],
    );

    bakenType.onValueChanges(
      onData: (previous, current) async* {
        int prevNum = previous.value?.predictionNum ?? 0;
        int curNum = current.value?.predictionNum ?? 0;

        if (prevNum != curNum) {
          bool isAdd = prevNum < curNum;
          for (int row = prevNum; row != curNum; isAdd ? row++ : row--) {
            if (isAdd) {
              predictions.addFieldBloc(
                  SelectFieldBloc(items: List.generate(12, (i) => i)));
            } else {
              predictions.removeFieldBlocAt(row - 1);
            }
          }
        }
      },
    );
  }

  @override
  void onSubmitting() async {
    // XXX: ここで押下時の処理を記載
  }
}

class BakenTypeModel {
  final String dispValue;
  final int predictionNum;

  const BakenTypeModel({required this.dispValue, this.predictionNum = 0});
}
