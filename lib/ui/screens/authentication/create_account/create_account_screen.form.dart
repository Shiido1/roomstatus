// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String HotelNameValueKey = 'hotel_name';
const String CountryValueKey = 'country';
const String StateValueKey = 'state';
const String CityValueKey = 'city';
const String AddressValueKey = 'address';

final Map<String, TextEditingController>
    _CreateAccountScreenTextEditingControllers = {};

final Map<String, FocusNode> _CreateAccountScreenFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CreateAccountScreenTextValidations = {
  HotelNameValueKey: null,
  CountryValueKey: null,
  StateValueKey: null,
  CityValueKey: null,
  AddressValueKey: null,
};

mixin $CreateAccountScreen {
  TextEditingController get hotelNameController =>
      _getFormTextEditingController(HotelNameValueKey);
  TextEditingController get countryController =>
      _getFormTextEditingController(CountryValueKey);
  TextEditingController get stateController =>
      _getFormTextEditingController(StateValueKey);
  TextEditingController get cityController =>
      _getFormTextEditingController(CityValueKey);
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);

  FocusNode get hotelNameFocusNode => _getFormFocusNode(HotelNameValueKey);
  FocusNode get countryFocusNode => _getFormFocusNode(CountryValueKey);
  FocusNode get stateFocusNode => _getFormFocusNode(StateValueKey);
  FocusNode get cityFocusNode => _getFormFocusNode(CityValueKey);
  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateAccountScreenTextEditingControllers.containsKey(key)) {
      return _CreateAccountScreenTextEditingControllers[key]!;
    }

    _CreateAccountScreenTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateAccountScreenTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateAccountScreenFocusNodes.containsKey(key)) {
      return _CreateAccountScreenFocusNodes[key]!;
    }
    _CreateAccountScreenFocusNodes[key] = FocusNode();
    return _CreateAccountScreenFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    hotelNameController.addListener(() => _updateFormData(model));
    countryController.addListener(() => _updateFormData(model));
    stateController.addListener(() => _updateFormData(model));
    cityController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    hotelNameController.addListener(() => _updateFormData(model));
    countryController.addListener(() => _updateFormData(model));
    stateController.addListener(() => _updateFormData(model));
    cityController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          HotelNameValueKey: hotelNameController.text,
          CountryValueKey: countryController.text,
          StateValueKey: stateController.text,
          CityValueKey: cityController.text,
          AddressValueKey: addressController.text,
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

    for (var controller in _CreateAccountScreenTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateAccountScreenFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateAccountScreenTextEditingControllers.clear();
    _CreateAccountScreenFocusNodes.clear();
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

  String? get hotelNameValue => this.formValueMap[HotelNameValueKey] as String?;
  String? get countryValue => this.formValueMap[CountryValueKey] as String?;
  String? get stateValue => this.formValueMap[StateValueKey] as String?;
  String? get cityValue => this.formValueMap[CityValueKey] as String?;
  String? get addressValue => this.formValueMap[AddressValueKey] as String?;

  set hotelNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({HotelNameValueKey: value}),
    );

    if (_CreateAccountScreenTextEditingControllers.containsKey(
        HotelNameValueKey)) {
      _CreateAccountScreenTextEditingControllers[HotelNameValueKey]?.text =
          value ?? '';
    }
  }

  set countryValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CountryValueKey: value}),
    );

    if (_CreateAccountScreenTextEditingControllers.containsKey(
        CountryValueKey)) {
      _CreateAccountScreenTextEditingControllers[CountryValueKey]?.text =
          value ?? '';
    }
  }

  set stateValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StateValueKey: value}),
    );

    if (_CreateAccountScreenTextEditingControllers.containsKey(StateValueKey)) {
      _CreateAccountScreenTextEditingControllers[StateValueKey]?.text =
          value ?? '';
    }
  }

  set cityValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CityValueKey: value}),
    );

    if (_CreateAccountScreenTextEditingControllers.containsKey(CityValueKey)) {
      _CreateAccountScreenTextEditingControllers[CityValueKey]?.text =
          value ?? '';
    }
  }

  set addressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AddressValueKey: value}),
    );

    if (_CreateAccountScreenTextEditingControllers.containsKey(
        AddressValueKey)) {
      _CreateAccountScreenTextEditingControllers[AddressValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasHotelName =>
      this.formValueMap.containsKey(HotelNameValueKey) &&
      (hotelNameValue?.isNotEmpty ?? false);
  bool get hasCountry =>
      this.formValueMap.containsKey(CountryValueKey) &&
      (countryValue?.isNotEmpty ?? false);
  bool get hasState =>
      this.formValueMap.containsKey(StateValueKey) &&
      (stateValue?.isNotEmpty ?? false);
  bool get hasCity =>
      this.formValueMap.containsKey(CityValueKey) &&
      (cityValue?.isNotEmpty ?? false);
  bool get hasAddress =>
      this.formValueMap.containsKey(AddressValueKey) &&
      (addressValue?.isNotEmpty ?? false);

  bool get hasHotelNameValidationMessage =>
      this.fieldsValidationMessages[HotelNameValueKey]?.isNotEmpty ?? false;
  bool get hasCountryValidationMessage =>
      this.fieldsValidationMessages[CountryValueKey]?.isNotEmpty ?? false;
  bool get hasStateValidationMessage =>
      this.fieldsValidationMessages[StateValueKey]?.isNotEmpty ?? false;
  bool get hasCityValidationMessage =>
      this.fieldsValidationMessages[CityValueKey]?.isNotEmpty ?? false;
  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;

  String? get hotelNameValidationMessage =>
      this.fieldsValidationMessages[HotelNameValueKey];
  String? get countryValidationMessage =>
      this.fieldsValidationMessages[CountryValueKey];
  String? get stateValidationMessage =>
      this.fieldsValidationMessages[StateValueKey];
  String? get cityValidationMessage =>
      this.fieldsValidationMessages[CityValueKey];
  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
}

extension Methods on FormStateHelper {
  setHotelNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[HotelNameValueKey] = validationMessage;
  setCountryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CountryValueKey] = validationMessage;
  setStateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StateValueKey] = validationMessage;
  setCityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CityValueKey] = validationMessage;
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    hotelNameValue = '';
    countryValue = '';
    stateValue = '';
    cityValue = '';
    addressValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      HotelNameValueKey: getValidationMessage(HotelNameValueKey),
      CountryValueKey: getValidationMessage(CountryValueKey),
      StateValueKey: getValidationMessage(StateValueKey),
      CityValueKey: getValidationMessage(CityValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateAccountScreenTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateAccountScreenTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      HotelNameValueKey: getValidationMessage(HotelNameValueKey),
      CountryValueKey: getValidationMessage(CountryValueKey),
      StateValueKey: getValidationMessage(StateValueKey),
      CityValueKey: getValidationMessage(CityValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
    });
