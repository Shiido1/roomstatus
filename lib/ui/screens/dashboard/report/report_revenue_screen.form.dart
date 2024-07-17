// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String RoomValueKey = 'room';
const String StartValueKey = 'start';
const String EndValueKey = 'end';

final Map<String, TextEditingController> _ReportRevenueTextEditingControllers =
    {};

final Map<String, FocusNode> _ReportRevenueFocusNodes = {};

final Map<String, String? Function(String?)?> _ReportRevenueTextValidations = {
  RoomValueKey: null,
  StartValueKey: null,
  EndValueKey: null,
};

mixin $ReportRevenue {
  TextEditingController get roomController =>
      _getFormTextEditingController(RoomValueKey);
  TextEditingController get startController =>
      _getFormTextEditingController(StartValueKey);
  TextEditingController get endController =>
      _getFormTextEditingController(EndValueKey);

  FocusNode get roomFocusNode => _getFormFocusNode(RoomValueKey);
  FocusNode get startFocusNode => _getFormFocusNode(StartValueKey);
  FocusNode get endFocusNode => _getFormFocusNode(EndValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ReportRevenueTextEditingControllers.containsKey(key)) {
      return _ReportRevenueTextEditingControllers[key]!;
    }

    _ReportRevenueTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ReportRevenueTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ReportRevenueFocusNodes.containsKey(key)) {
      return _ReportRevenueFocusNodes[key]!;
    }
    _ReportRevenueFocusNodes[key] = FocusNode();
    return _ReportRevenueFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    roomController.addListener(() => _updateFormData(model));
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
    roomController.addListener(() => _updateFormData(model));
    startController.addListener(() => _updateFormData(model));
    endController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          RoomValueKey: roomController.text,
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

    for (var controller in _ReportRevenueTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ReportRevenueFocusNodes.values) {
      focusNode.dispose();
    }

    _ReportRevenueTextEditingControllers.clear();
    _ReportRevenueFocusNodes.clear();
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

  String? get roomValue => this.formValueMap[RoomValueKey] as String?;
  String? get startValue => this.formValueMap[StartValueKey] as String?;
  String? get endValue => this.formValueMap[EndValueKey] as String?;

  set roomValue(String? value) {
    this.setData(
      this.formValueMap..addAll({RoomValueKey: value}),
    );

    if (_ReportRevenueTextEditingControllers.containsKey(RoomValueKey)) {
      _ReportRevenueTextEditingControllers[RoomValueKey]?.text = value ?? '';
    }
  }

  set startValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StartValueKey: value}),
    );

    if (_ReportRevenueTextEditingControllers.containsKey(StartValueKey)) {
      _ReportRevenueTextEditingControllers[StartValueKey]?.text = value ?? '';
    }
  }

  set endValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EndValueKey: value}),
    );

    if (_ReportRevenueTextEditingControllers.containsKey(EndValueKey)) {
      _ReportRevenueTextEditingControllers[EndValueKey]?.text = value ?? '';
    }
  }

  bool get hasRoom =>
      this.formValueMap.containsKey(RoomValueKey) &&
      (roomValue?.isNotEmpty ?? false);
  bool get hasStart =>
      this.formValueMap.containsKey(StartValueKey) &&
      (startValue?.isNotEmpty ?? false);
  bool get hasEnd =>
      this.formValueMap.containsKey(EndValueKey) &&
      (endValue?.isNotEmpty ?? false);

  bool get hasRoomValidationMessage =>
      this.fieldsValidationMessages[RoomValueKey]?.isNotEmpty ?? false;
  bool get hasStartValidationMessage =>
      this.fieldsValidationMessages[StartValueKey]?.isNotEmpty ?? false;
  bool get hasEndValidationMessage =>
      this.fieldsValidationMessages[EndValueKey]?.isNotEmpty ?? false;

  String? get roomValidationMessage =>
      this.fieldsValidationMessages[RoomValueKey];
  String? get startValidationMessage =>
      this.fieldsValidationMessages[StartValueKey];
  String? get endValidationMessage =>
      this.fieldsValidationMessages[EndValueKey];
}

extension Methods on FormStateHelper {
  setRoomValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RoomValueKey] = validationMessage;
  setStartValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StartValueKey] = validationMessage;
  setEndValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EndValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    roomValue = '';
    startValue = '';
    endValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      RoomValueKey: getValidationMessage(RoomValueKey),
      StartValueKey: getValidationMessage(StartValueKey),
      EndValueKey: getValidationMessage(EndValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ReportRevenueTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ReportRevenueTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      RoomValueKey: getValidationMessage(RoomValueKey),
      StartValueKey: getValidationMessage(StartValueKey),
      EndValueKey: getValidationMessage(EndValueKey),
    });
