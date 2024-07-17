// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String StartValueKey = 'start';
const String EndValueKey = 'end';

final Map<String, TextEditingController>
    _ProfitAndLossScreenTextEditingControllers = {};

final Map<String, FocusNode> _ProfitAndLossScreenFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ProfitAndLossScreenTextValidations = {
  StartValueKey: null,
  EndValueKey: null,
};

mixin $ProfitAndLossScreen {
  TextEditingController get startController =>
      _getFormTextEditingController(StartValueKey);
  TextEditingController get endController =>
      _getFormTextEditingController(EndValueKey);

  FocusNode get startFocusNode => _getFormFocusNode(StartValueKey);
  FocusNode get endFocusNode => _getFormFocusNode(EndValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ProfitAndLossScreenTextEditingControllers.containsKey(key)) {
      return _ProfitAndLossScreenTextEditingControllers[key]!;
    }

    _ProfitAndLossScreenTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ProfitAndLossScreenTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ProfitAndLossScreenFocusNodes.containsKey(key)) {
      return _ProfitAndLossScreenFocusNodes[key]!;
    }
    _ProfitAndLossScreenFocusNodes[key] = FocusNode();
    return _ProfitAndLossScreenFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    startController.addListener(() => _updateFormData(model));
    endController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    startController.addListener(() => _updateFormData(model));
    endController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          StartValueKey: startController.text,
          EndValueKey: endController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _ProfitAndLossScreenTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ProfitAndLossScreenFocusNodes.values) {
      focusNode.dispose();
    }

    _ProfitAndLossScreenTextEditingControllers.clear();
    _ProfitAndLossScreenFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get startValue => this.formValueMap[StartValueKey] as String?;
  String? get endValue => this.formValueMap[EndValueKey] as String?;

  set startValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StartValueKey: value}),
    );

    if (_ProfitAndLossScreenTextEditingControllers.containsKey(StartValueKey)) {
      _ProfitAndLossScreenTextEditingControllers[StartValueKey]?.text =
          value ?? '';
    }
  }

  set endValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EndValueKey: value}),
    );

    if (_ProfitAndLossScreenTextEditingControllers.containsKey(EndValueKey)) {
      _ProfitAndLossScreenTextEditingControllers[EndValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasStart =>
      this.formValueMap.containsKey(StartValueKey) &&
      (startValue?.isNotEmpty ?? false);
  bool get hasEnd =>
      this.formValueMap.containsKey(EndValueKey) &&
      (endValue?.isNotEmpty ?? false);

  bool get hasStartValidationMessage =>
      this.fieldsValidationMessages[StartValueKey]?.isNotEmpty ?? false;
  bool get hasEndValidationMessage =>
      this.fieldsValidationMessages[EndValueKey]?.isNotEmpty ?? false;

  String? get startValidationMessage =>
      this.fieldsValidationMessages[StartValueKey];
  String? get endValidationMessage =>
      this.fieldsValidationMessages[EndValueKey];
}

extension Methods on FormStateHelper {
  setStartValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StartValueKey] = validationMessage;
  setEndValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EndValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    startValue = '';
    endValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      StartValueKey: getValidationMessage(StartValueKey),
      EndValueKey: getValidationMessage(EndValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ProfitAndLossScreenTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ProfitAndLossScreenTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      StartValueKey: getValidationMessage(StartValueKey),
      EndValueKey: getValidationMessage(EndValueKey),
    });
