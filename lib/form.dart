import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
		const MyApp({Key key}) : super(key: key);

		@override
		Widget build(BuildContext context) {
				return MaterialApp(
						title: 'Quiz App Form',
						theme: ThemeData(
								primarySwatch: Colors.blue,
						),
						home: const QuizForm(title: 'Quiz App'),
				);
		}
}

class QuizForm extends StatefulWidget {
		const QuizForm({Key key, this.title}) : super(key: key);

		final String title;

		@override
		_QuizFormState createState() => _QuizFormState();
}

class _QuizFormState extends State<QuizForm> {
		final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

		@override
		Widget build(BuildContext context) {
				return Scaffold(
						appBar: AppBar(
								title: Text(widget.title),
						),
						body: FormBuilder(
								key: _fbKey,
								initialValue: {
										'date': DateTime.now(),
										'accept_terms': false,
								},
								autovalidate: true,
								child: Column(
										children: <Widget>[
								// -- Textinput field 
												FormBuilderTextField(
														attribute: "text",
														decoration: InputDecoration(labelText: "Text"),
														maxLength: 25,
														maxLines: 1,
														onChanged: _onChanged,
														valueTransformer: (text) => num.tryParse(text),
														validators: [
																FormBuilderValidators.required(),
																FormBuilderValidators.max(70),
														],
												),
												// -- Date-picker
												FormBuilderDateTimePicker(
														attribute: "date",
														inputType: InputType.date,
														format: DateFormat("dd-MM-yyyy"),
														decoration: InputDecoration(labelText: "Appointment Time"),
														initialValue: DateTime.now(),
														firstDate: DateTime(2000),
														lastDate: DateTime(2100),
														// onChanged: _onChanged,
														// valueTransformer: (text) => num.tryParse(text),
														validators: [FormBuilderValidators.required()],
												),
												// -- Dropdown 
												FormBuilderDropdown<String>(
                      name: 'gender',
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        suffix: _genderHasError
                            ? const Icon(Icons.error)
                            : const Icon(Icons.check),
                        hintText: 'Select Gender',
                      ),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                      items: genderOptions
                          .map((gender) => DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _genderHasError = !(_formKey
                                  .currentState?.fields['gender']
                                  ?.validate() ??
                              false);
                        });
                      },
                      valueTransformer: (val) => val?.toString(),
                    ),
												// -- Form Builder Slider
												FormBuilderSlider(
														attribute: "slider",
														min: 0.0,
														max: 10.0,
														initialValue: 1.0,
														divisions: 20,
														activeColor: Colors.red,
														inactiveColor: Colors.pink[100],
														// onChanged: _onChanged,
												),
												// -- Form Builder Switch
												FormBuilderSwitch(
														label: Text('I Accept the tems and conditions'),
														attribute: "accept_terms",
														initialValue: true,
														onChanged: _onChanged,
												),
												// -- Form Builder Checkbox
												FormBuilderCheckbox(
														label: Text('I Accept the tems and conditions'),
														attribute: "accept_terms",
														initialValue: true,
														onChanged: _onChanged,
												),
										]
								)
						)
				)
		}};









