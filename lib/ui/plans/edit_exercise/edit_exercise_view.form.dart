// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String NameValueKey = 'name';
const String WeightIncrementValueKey = 'weightIncrement';
const String MachineSettingsValueKey = 'machineSettings';
const String DefaultNumberOfSetsValueKey = 'defaultNumberOfSets';
const String UnitValueKey = 'unit';

final Map<String, String> UnitValueToTitleMap = {
  'kg': 'Kilogram',
  'lbs': 'Pounds',
};

final Map<String, TextEditingController>
    _EditExerciseViewTextEditingControllers = {};

final Map<String, FocusNode> _EditExerciseViewFocusNodes = {};

final Map<String, String? Function(String?)?> _EditExerciseViewTextValidations =
    {
  NameValueKey: null,
  WeightIncrementValueKey: null,
  MachineSettingsValueKey: null,
  DefaultNumberOfSetsValueKey: null,
};

mixin $EditExerciseView on StatelessWidget {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get weightIncrementController =>
      _getFormTextEditingController(WeightIncrementValueKey);
  TextEditingController get machineSettingsController =>
      _getFormTextEditingController(MachineSettingsValueKey);
  TextEditingController get defaultNumberOfSetsController =>
      _getFormTextEditingController(DefaultNumberOfSetsValueKey);
  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get weightIncrementFocusNode =>
      _getFormFocusNode(WeightIncrementValueKey);
  FocusNode get machineSettingsFocusNode =>
      _getFormFocusNode(MachineSettingsValueKey);
  FocusNode get defaultNumberOfSetsFocusNode =>
      _getFormFocusNode(DefaultNumberOfSetsValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_EditExerciseViewTextEditingControllers.containsKey(key)) {
      return _EditExerciseViewTextEditingControllers[key]!;
    }
    _EditExerciseViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditExerciseViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditExerciseViewFocusNodes.containsKey(key)) {
      return _EditExerciseViewFocusNodes[key]!;
    }
    _EditExerciseViewFocusNodes[key] = FocusNode();
    return _EditExerciseViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    weightIncrementController.addListener(() => _updateFormData(model));
    machineSettingsController.addListener(() => _updateFormData(model));
    defaultNumberOfSetsController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the dynamic
  void _updateFormData(dynamic model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameValueKey: nameController.text,
          WeightIncrementValueKey: weightIncrementController.text,
          MachineSettingsValueKey: machineSettingsController.text,
          DefaultNumberOfSetsValueKey: defaultNumberOfSetsController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        NameValueKey: _getValidationMessage(NameValueKey),
        WeightIncrementValueKey: _getValidationMessage(WeightIncrementValueKey),
        MachineSettingsValueKey: _getValidationMessage(MachineSettingsValueKey),
        DefaultNumberOfSetsValueKey:
            _getValidationMessage(DefaultNumberOfSetsValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _EditExerciseViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_EditExerciseViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditExerciseViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditExerciseViewFocusNodes.values) {
      focusNode.dispose();
    }

    _EditExerciseViewTextEditingControllers.clear();
    _EditExerciseViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get weightIncrementValue =>
      this.formValueMap[WeightIncrementValueKey] as String?;
  String? get machineSettingsValue =>
      this.formValueMap[MachineSettingsValueKey] as String?;
  String? get defaultNumberOfSetsValue =>
      this.formValueMap[DefaultNumberOfSetsValueKey] as String?;
  String? get unitValue => this.formValueMap[UnitValueKey] as String?;

  bool get hasName => this.formValueMap.containsKey(NameValueKey);
  bool get hasWeightIncrement =>
      this.formValueMap.containsKey(WeightIncrementValueKey);
  bool get hasMachineSettings =>
      this.formValueMap.containsKey(MachineSettingsValueKey);
  bool get hasDefaultNumberOfSets =>
      this.formValueMap.containsKey(DefaultNumberOfSetsValueKey);
  bool get hasUnit => this.formValueMap.containsKey(UnitValueKey);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasWeightIncrementValidationMessage =>
      this.fieldsValidationMessages[WeightIncrementValueKey]?.isNotEmpty ??
      false;
  bool get hasMachineSettingsValidationMessage =>
      this.fieldsValidationMessages[MachineSettingsValueKey]?.isNotEmpty ??
      false;
  bool get hasDefaultNumberOfSetsValidationMessage =>
      this.fieldsValidationMessages[DefaultNumberOfSetsValueKey]?.isNotEmpty ??
      false;
  bool get hasUnitValidationMessage =>
      this.fieldsValidationMessages[UnitValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get weightIncrementValidationMessage =>
      this.fieldsValidationMessages[WeightIncrementValueKey];
  String? get machineSettingsValidationMessage =>
      this.fieldsValidationMessages[MachineSettingsValueKey];
  String? get defaultNumberOfSetsValidationMessage =>
      this.fieldsValidationMessages[DefaultNumberOfSetsValueKey];
  String? get unitValidationMessage =>
      this.fieldsValidationMessages[UnitValueKey];
}

extension Methods on FormViewModel {
  void setUnit(String unit) {
    this.setData(this.formValueMap..addAll({UnitValueKey: unit}));
  }

  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setWeightIncrementValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WeightIncrementValueKey] =
          validationMessage;
  setMachineSettingsValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MachineSettingsValueKey] =
          validationMessage;
  setDefaultNumberOfSetsValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DefaultNumberOfSetsValueKey] =
          validationMessage;
  setUnitValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UnitValueKey] = validationMessage;
}
