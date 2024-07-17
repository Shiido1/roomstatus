// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String DateValueKey = 'date';

final Map<String, TextEditingController>
    _GuestListScreenTextEditingControllers = {};

final Map<String, FocusNode> _GuestListScreenFocusNodes = {};

final Map<String, String? Function(String?)?> _GuestListScreenTextValidations =
    {
  DateValueKey: null,
};

mixin $GuestListScreen {
  TextEditingController get dateController =>
      _getFormTextEditingController(DateValueKey);

  FocusNode get dateFocusNode => _getFormFocusNode(DateValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_GuestListScreenTextEditingControllers.containsKey(key)) {
      return _GuestListScreenTextEditingControllers[key]!;
    }

    _GuestListScreenTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _GuestListScreenTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_GuestListScreenFocusNodes.containsKey(key)) {
      return _GuestListScreenFocusNodes[key]!;
    }
    _GuestListScreenFocusNodes[key] = FocusNode();
    return _GuestListScreenFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    dateController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    dateController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          DateValueKey: dateController.text,
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

    for (var controller in _GuestListScreenTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _GuestListScreenFocusNodes.values) {
      focusNode.dispose();
    }

    _GuestListScreenTextEditingControllers.clear();
    _GuestListScreenFocusNodes.clear();
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

  String? get dateValue => this.formValueMap[DateValueKey] as String?;

  set dateValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DateValueKey: value}),
    );

    if (_GuestListScreenTextEditingControllers.containsKey(DateValueKey)) {
      _GuestListScreenTextEditingControllers[DateValueKey]?.text = value ?? '';
    }
  }

  bool get hasDate =>
      this.formValueMap.containsKey(DateValueKey) &&
      (dateValue?.isNotEmpty ?? false);

  bool get hasDateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey]?.isNotEmpty ?? false;

  String? get dateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey];
}

extension Methods on FormStateHelper {
  setDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DateValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    dateValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      DateValueKey: getValidationMessage(DateValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _GuestListScreenTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _GuestListScreenTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      DateValueKey: getValidationMessage(DateValueKey),
    });
