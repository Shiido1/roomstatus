// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FirstNameValueKey = 'first_name';
const String LastNameValueKey = 'last_name';
const String TelephoneValueKey = 'telephone';
const String EmailValueKey = 'email';
const String PasswordValueKey = 'password';
const String PaswordConfirmValueKey = 'pasword_confirm';

final Map<String, TextEditingController>
    _CreateAccountSecondScreenTextEditingControllers = {};

final Map<String, FocusNode> _CreateAccountSecondScreenFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CreateAccountSecondScreenTextValidations = {
  FirstNameValueKey: null,
  LastNameValueKey: null,
  TelephoneValueKey: null,
  EmailValueKey: null,
  PasswordValueKey: null,
  PaswordConfirmValueKey: null,
};

mixin $CreateAccountSecondScreen {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get telephoneController =>
      _getFormTextEditingController(TelephoneValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get passwordController =>
      _getFormTextEditingController(PasswordValueKey);
  TextEditingController get paswordConfirmController =>
      _getFormTextEditingController(PaswordConfirmValueKey);

  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get telephoneFocusNode => _getFormFocusNode(TelephoneValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get passwordFocusNode => _getFormFocusNode(PasswordValueKey);
  FocusNode get paswordConfirmFocusNode =>
      _getFormFocusNode(PaswordConfirmValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateAccountSecondScreenTextEditingControllers.containsKey(key)) {
      return _CreateAccountSecondScreenTextEditingControllers[key]!;
    }

    _CreateAccountSecondScreenTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateAccountSecondScreenTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateAccountSecondScreenFocusNodes.containsKey(key)) {
      return _CreateAccountSecondScreenFocusNodes[key]!;
    }
    _CreateAccountSecondScreenFocusNodes[key] = FocusNode();
    return _CreateAccountSecondScreenFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    telephoneController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    paswordConfirmController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    telephoneController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    paswordConfirmController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FirstNameValueKey: firstNameController.text,
          LastNameValueKey: lastNameController.text,
          TelephoneValueKey: telephoneController.text,
          EmailValueKey: emailController.text,
          PasswordValueKey: passwordController.text,
          PaswordConfirmValueKey: paswordConfirmController.text,
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

    for (var controller
        in _CreateAccountSecondScreenTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateAccountSecondScreenFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateAccountSecondScreenTextEditingControllers.clear();
    _CreateAccountSecondScreenFocusNodes.clear();
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

  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get telephoneValue => this.formValueMap[TelephoneValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get passwordValue => this.formValueMap[PasswordValueKey] as String?;
  String? get paswordConfirmValue =>
      this.formValueMap[PaswordConfirmValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstNameValueKey: value}),
    );

    if (_CreateAccountSecondScreenTextEditingControllers.containsKey(
        FirstNameValueKey)) {
      _CreateAccountSecondScreenTextEditingControllers[FirstNameValueKey]
          ?.text = value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastNameValueKey: value}),
    );

    if (_CreateAccountSecondScreenTextEditingControllers.containsKey(
        LastNameValueKey)) {
      _CreateAccountSecondScreenTextEditingControllers[LastNameValueKey]?.text =
          value ?? '';
    }
  }

  set telephoneValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TelephoneValueKey: value}),
    );

    if (_CreateAccountSecondScreenTextEditingControllers.containsKey(
        TelephoneValueKey)) {
      _CreateAccountSecondScreenTextEditingControllers[TelephoneValueKey]
          ?.text = value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_CreateAccountSecondScreenTextEditingControllers.containsKey(
        EmailValueKey)) {
      _CreateAccountSecondScreenTextEditingControllers[EmailValueKey]?.text =
          value ?? '';
    }
  }

  set passwordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordValueKey: value}),
    );

    if (_CreateAccountSecondScreenTextEditingControllers.containsKey(
        PasswordValueKey)) {
      _CreateAccountSecondScreenTextEditingControllers[PasswordValueKey]?.text =
          value ?? '';
    }
  }

  set paswordConfirmValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PaswordConfirmValueKey: value}),
    );

    if (_CreateAccountSecondScreenTextEditingControllers.containsKey(
        PaswordConfirmValueKey)) {
      _CreateAccountSecondScreenTextEditingControllers[PaswordConfirmValueKey]
          ?.text = value ?? '';
    }
  }

  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasTelephone =>
      this.formValueMap.containsKey(TelephoneValueKey) &&
      (telephoneValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasPassword =>
      this.formValueMap.containsKey(PasswordValueKey) &&
      (passwordValue?.isNotEmpty ?? false);
  bool get hasPaswordConfirm =>
      this.formValueMap.containsKey(PaswordConfirmValueKey) &&
      (paswordConfirmValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasTelephoneValidationMessage =>
      this.fieldsValidationMessages[TelephoneValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasPasswordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey]?.isNotEmpty ?? false;
  bool get hasPaswordConfirmValidationMessage =>
      this.fieldsValidationMessages[PaswordConfirmValueKey]?.isNotEmpty ??
      false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get telephoneValidationMessage =>
      this.fieldsValidationMessages[TelephoneValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get passwordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey];
  String? get paswordConfirmValidationMessage =>
      this.fieldsValidationMessages[PaswordConfirmValueKey];
}

extension Methods on FormStateHelper {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setTelephoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TelephoneValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordValueKey] = validationMessage;
  setPaswordConfirmValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PaswordConfirmValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    telephoneValue = '';
    emailValue = '';
    passwordValue = '';
    paswordConfirmValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      TelephoneValueKey: getValidationMessage(TelephoneValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
      PaswordConfirmValueKey: getValidationMessage(PaswordConfirmValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateAccountSecondScreenTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateAccountSecondScreenTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      TelephoneValueKey: getValidationMessage(TelephoneValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
      PaswordConfirmValueKey: getValidationMessage(PaswordConfirmValueKey),
    });
