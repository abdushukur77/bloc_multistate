import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/bank/data_cubit.dart';
import '../cubits/bank/data_state.dart';
import '../data/models/data_model.dart';
import '../utils/styles/app_text_style.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({super.key});

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            "Transaction Screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: BlocBuilder<BankCubit, BankState>(
          builder: (BuildContext context, state) {
            if (state is LoadingBankState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is ErrorBankState) {
              return Center(
                child: Text(
                  state.errorText,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              );
            }
            state as SuccessBankState;
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: List.generate(state.data.length, (index) {
                TransactionsModel currencyModel = state.data[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),

                          boxShadow: [

                          ],
                        ),
                        child:  ListTile(
                          title: Text(
                            currencyModel.data[0].sender.name,
                            style: AppTextStyle.interBold.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          subtitle: Text(
                            currencyModel.data[0].sender.location,
                            style: AppTextStyle.interBold.copyWith(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: currencyModel.data[0].sender.brandImage,
                              errorWidget: (context, url, error) =>
                                  CachedNetworkImage(
                                    imageUrl:
                                    "https://bekey.io/static/images/flutter/flutter-logo.png",
                                  ),
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          trailing: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 5,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                  "-${currencyModel.data[0].amount} UZS\n",
                                  style: AppTextStyle.interBold
                                      .copyWith(color: Colors.white),
                                ),
                                TextSpan(
                                  text: currencyModel.transferDate,
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.white.withOpacity(
                                      0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          title: Text(
                            currencyModel.data[1].sender.name,
                            style: AppTextStyle.interBold.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          subtitle: Text(
                            currencyModel.data[0].sender.location,
                            style: AppTextStyle.interBold.copyWith(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: currencyModel.data[1].sender.brandImage,
                              errorWidget: (context, url, error) =>
                                  CachedNetworkImage(
                                imageUrl:
                                    "https://bekey.io/static/images/flutter/flutter-logo.png",
                              ),
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          trailing: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 5,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "-${currencyModel.data[1].amount} UZS\n",
                                  style: AppTextStyle.interBold
                                      .copyWith(color: Colors.white),
                                ),
                                TextSpan(
                                  text: currencyModel.transferDate,
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.white.withOpacity(
                                      0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            );
            ;
          },
        ));
  }
}
