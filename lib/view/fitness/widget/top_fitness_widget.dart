import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/ApiClient/api_client.dart';
import 'package:zatayo/cubit/fitness/fitness_cubit.dart';
import 'package:zatayo/cubit/fitness/fitness_state.dart';
import 'package:zatayo/model/fitness/fitness_response_model.dart';

import '../../common_widget/common_text_widget.dart';
import '../../individual_sports_gym/screen/individual_gym.dart';

class TopFitnessWidget extends StatefulWidget {
  const TopFitnessWidget({super.key});

  @override
  State<TopFitnessWidget> createState() => _TopFitnessWidgetState();
}

class _TopFitnessWidgetState extends State<TopFitnessWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FitnessCubit, FitnessState>(
      builder: (BuildContext context, state) {
        if (state is GetFitnessSuccess) {
          final fitnessData = state.fitnessResponseModel.data;
          return Column(
            children: [
              SizedBox(height: 20,),
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                // Allows ListView to take only the space it needs
                physics: NeverScrollableScrollPhysics(),
                // Disables scrolling
                itemCount: fitnessData?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      final args = FitnessDataModel(
                     fitnessId: fitnessData[index].fitnessId,
                     name: fitnessData[index].name,
                     description:  fitnessData[index].description,
                    latitude: fitnessData[index].latitude,
                        locationName: fitnessData[index].locationName,
                        longitude: fitnessData[index].longitude,
                        images: fitnessData[index].images,
                        equipmentData: fitnessData[index].equipmentData
                      );

                      context.push(IndividualGym.routeName,
                      extra:  args
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: double.infinity,
                            height: 230,
                            decoration: ShapeDecoration(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child:  ClipRRect(
                              borderRadius:
                              BorderRadius.circular(
                                  10),
                              child: CachedNetworkImage(
                                imageUrl: "$baseUrl/${fitnessData![index].images?.first.image ?? ''}",
                                fit: BoxFit.cover,
                                placeholder: (context,
                                    url) =>
                                const Center(
                                    child:
                                    CircularProgressIndicator(
                                      strokeWidth: 1,
                                    )),
                                errorWidget: (context,
                                    url, error) =>
                                const Icon(
                                    Icons.error),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextWidget(
                                text: fitnessData[index].name ?? '',
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CommonTextWidget(text: '4.5')
                                ],
                              ),
                            ],
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 30,
                              ),
                              Expanded(
                                child: CommonTextWidget(
                                  text: fitnessData[index].locationName ?? '',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        }
        return SizedBox();
      },);
  }
}
