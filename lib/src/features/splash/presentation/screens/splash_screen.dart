import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_constants.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/splash/presentation/bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: AppConstants.animationTime),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
    Future.delayed(const Duration(milliseconds: AppConstants.navigateTime), () {
      if (mounted) {
        context.read<SplashBloc>().add(StartUpEvent());
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashGetUserSuccessfully && state.user != null) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false, arguments: state.user);
        }
        if ((state is SplashGetUserSuccessfully && state.user == null) ||
            state is SplashGetUserFailed) {
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.onboarding, (route) => false);
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: context.width,
          height: context.height,
          child: FadeTransition(
            opacity: _animation,
            child: Stack(
              children: [
                _buildSplashImage(),
                Positioned(
                  bottom: context.height * 0.02,
                  right: context.width * 0.04,
                  child: _buildSplashBottomLogo(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Align _buildSplashBottomLogo(BuildContext context) {
  return const Align(
    alignment: Alignment.bottomRight,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          AppStrings.version,
          style: TextStyle(
            color: AppColors.green,
            fontFamily: AppFonts.albertSans,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
        Text(
          AppStrings.inaing,
          style: TextStyle(
            color: AppColors.green,
            fontFamily: AppFonts.albertSans,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
      ],
    ),
  );
}

Align _buildSplashImage() {
  return Align(alignment: Alignment.center, child: SvgPicture.asset(AppImages.logo));
}
