import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../../core/components/widgets/custom_input.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/styles.dart';
import '../../../state/appointemt_data_state.dart';
import 'appointment_card.dart';

class AppointmentPage extends ConsumerStatefulWidget {
  const AppointmentPage({super.key});

  @override
  ConsumerState<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends ConsumerState<AppointmentPage> {
  final FocusNode _focus = FocusNode();

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var appointments = ref.watch(appointmentStreamProvider);
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('My Appointments'.toUpperCase(),
                        style: GoogleFonts.laila(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomTextFields(
                        controller: _controller,
                        hintText: 'search appointment',
                        focusNode: _focus,
                        suffixIcon: _focus.hasFocus
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    _controller.clear();
                                    ref
                                        .read(appointmentSearchQuery.notifier)
                                        .state = '';
                                    _focus.unfocus();
                                  });
                                },
                                icon: Icon(MdiIcons.close, color: primaryColor))
                            : Icon(MdiIcons.magnify, color: primaryColor),
                        onChanged: (value) {
                          ref.read(appointmentSearchQuery.notifier).state =
                              value;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: appointments.when(
              data: (data) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: _focus.hasFocus
                      ? LayoutBuilder(builder: (context, constraint) {
                          var list = ref.watch(searchAppointmentProvider);
                          if (list.isNotEmpty) {
                            return ListView.builder(
                              padding: const EdgeInsets.only(bottom: 150),
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return AppointmentCard(list[index].id!);
                              },
                            );
                          } else {
                            return Center(
                                child: Text('No Appointment Found',
                                    style: normalText()));
                          }
                        })
                      : data.isNotEmpty
                          ? ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                var appointment = data[index];
                                return AppointmentCard(appointment.id!);
                              })
                          : Center(
                              child: Text('No Appointment Found',
                                  style: normalText())),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Text(
                    'Something went wrong',
                    style: normalText(color: Colors.grey),
                  ),
                );
              },
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
        ),
      ],
    );
  }
}
