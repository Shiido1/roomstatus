// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String DiscountValueKey = 'discount';
const String PayModeValueKey = 'pay_mode';
const String AmountValueKey = 'amount';

final Map<String, TextEditingController>
    _AddBookingScreenTextEditingControllers = {};

final Map<String, FocusNode> _AddBookingScreenFocusNodes = {};

final Map<String, String? Function(String?)?> _AddBookingScreenTextValidations =
    {
  DiscountValueKey: null,
  PayModeValueKey: null,
  AmountValueKey: null,
};

mixin $AddBookingScreen {
  TextEditingController get discountController =>
      _getFormTextEditingController(DiscountValueKey);
  TextEditingController get payModeController =>
      _getFormTextEditingController(PayModeValueKey);
  TextEditingController get amountController =>
      _getFormTextEditingController(AmountValueKey);

  FocusNode get discountFocusNode => _getFormFocusNode(DiscountValueKey);
  FocusNode get payModeFocusNode => _getFormFocusNode(PayModeValueKey);
  FocusNode get amountFocusNode => _getFormFocusNode(AmountValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddBookingScreenTextEditingControllers.containsKey(key)) {
      return _AddBookingScreenTextEditingControllers[key]!;
    }

    _AddBookingScreenTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddBookingScreenTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddBookingScreenFocusNodes.containsKey(key)) {
      return _AddBookingScreenFocusNodes[key]!;
    }
    _AddBookingScreenFocusNodes[key] = FocusNode();
    return _AddBookingScreenFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    discountController.addListener(() => _updateFormData(model));
    payModeController.addListener(() => _updateFormData(model));
    amountController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    discountController.addListener(() => _updateFormData(model));
    payModeController.addListener(() => _updateFormData(model));
    amountController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          DiscountValueKey: discountController.text,
          PayModeValueKey: payModeController.text,
          AmountValueKey: amountController.text,
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

    for (var controller in _AddBookingScreenTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddBookingScreenFocusNodes.values) {
      focusNode.dispose();
    }

    _AddBookingScreenTextEditingControllers.clear();
    _AddBookingScreenFocusNodes.clear();
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

  String? get discountValue => this.formValueMap[DiscountValueKey] as String?;
  String? get payModeValue => this.formValueMap[PayModeValueKey] as String?;
  String? get amountValue => this.formValueMap[AmountValueKey] as String?;

  set discountValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DiscountValueKey: value}),
    );

    if (_AddBookingScreenTextEditingControllers.containsKey(DiscountValueKey)) {
      _AddBookingScreenTextEditingControllers[DiscountValueKey]?.text =
          value ?? '';
    }
  }

  set payModeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PayModeValueKey: value}),
    );

    if (_AddBookingScreenTextEditingControllers.containsKey(PayModeValueKey)) {
      _AddBookingScreenTextEditingControllers[PayModeValueKey]?.text =
          value ?? '';
    }
  }

  set amountValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AmountValueKey: value}),
    );

    if (_AddBookingScreenTextEditingControllers.containsKey(AmountValueKey)) {
      _AddBookingScreenTextEditingControllers[AmountValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasDiscount =>
      this.formValueMap.containsKey(DiscountValueKey) &&
      (discountValue?.isNotEmpty ?? false);
  bool get hasPayMode =>
      this.formValueMap.containsKey(PayModeValueKey) &&
      (payModeValue?.isNotEmpty ?? false);
  bool get hasAmount =>
      this.formValueMap.containsKey(AmountValueKey) &&
      (amountValue?.isNotEmpty ?? false);

  bool get hasDiscountValidationMessage =>
      this.fieldsValidationMessages[DiscountValueKey]?.isNotEmpty ?? false;
  bool get hasPayModeValidationMessage =>
      this.fieldsValidationMessages[PayModeValueKey]?.isNotEmpty ?? false;
  bool get hasAmountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey]?.isNotEmpty ?? false;

  String? get discountValidationMessage =>
      this.fieldsValidationMessages[DiscountValueKey];
  String? get payModeValidationMessage =>
      this.fieldsValidationMessages[PayModeValueKey];
  String? get amountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey];
}

extension Methods on FormStateHelper {
  setDiscountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DiscountValueKey] = validationMessage;
  setPayModeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PayModeValueKey] = validationMessage;
  setAmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AmountValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    discountValue = '';
    payModeValue = '';
    amountValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      DiscountValueKey: getValidationMessage(DiscountValueKey),
      PayModeValueKey: getValidationMessage(PayModeValueKey),
      AmountValueKey: getValidationMessage(AmountValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddBookingScreenTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddBookingScreenTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      DiscountValueKey: getValidationMessage(DiscountValueKey),
      PayModeValueKey: getValidationMessage(PayModeValueKey),
      AmountValueKey: getValidationMessage(AmountValueKey),
    });
