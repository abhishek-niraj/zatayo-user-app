import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/cubit/customer_details/customer_basic_information_cubit.dart';
import 'package:zatayo/cubit/customer_details/customer_details_cubit.dart';
import 'package:zatayo/cubit/customer_details/customer_details_state.dart';
import 'package:zatayo/model/customer/customer_basic_information_model.dart';

import '../../notification/screen/notification_screen.dart';
import '../../pick_an_area/screen/pick_an_area_screen.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good Morning ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF818898),
                  fontSize: 14,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.28,
                ),
              ),
              const SizedBox(height: 4),
              BlocBuilder<CustomerDetailsCubit, CustomerDetailsState>(
                builder: (BuildContext context, state) {
                  if (state is GetCustomerDetailSuccess) {
                    context.read<CustomerBasicInformationCubit>().updateModel(
                        customerId: state.customerDetailsResponseModel.data
                                ?.first.customerId ??
                            '',
                        customerName: state.customerDetailsResponseModel.data
                                ?.first.name ??
                            '');
                    return Text(
                      'Hi, ${state.customerDetailsResponseModel.data?.first.name} !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFD3D1D8),
                        fontSize: 18,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }
                  return SizedBox();
                },
              )
            ],
          ),
          InkWell(
            onTap: () {
              // context.push(NotificationScreen.routeName);
              context.push(PickAnAreaScreen.routeName);
            },
            child: Container(
              width: 48,
              height: 48,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFDFE1E7)),
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Icon(
                      Icons.search,
                      size: 27,
                      color: Color(0xFFF5F5F5),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 15,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFDF1C41),
                        shape: OvalBorder(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
