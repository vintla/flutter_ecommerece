import 'package:ecommerce_app/app/presentation/application/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application_cubit.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationCubit, ApplicationStates>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: _buildPage(
              state.index,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [],
              onTap: (value) {
                context.read<ApplicationCubit>().menuIndex(value);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildPage(int index) {
    List<Widget> pages = [
      const HomePage(),
      const Center(
        child: Text("Notifications"),
      ),
      const Center(
        child: Text("Orders"),
      ),
      const Center(
        child: Text("Profile"),
      )
    ];

    return pages[index];
  }
}
