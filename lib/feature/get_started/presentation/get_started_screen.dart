import 'package:flutter/material.dart';
import 'package:wizh/core/route/app_route_name.dart';
import 'package:wizh/core/theme/app_color.dart';

/// A welcome screen that introduces the app and provides entry points for
/// new and existing users to begin their experience.
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          _TopIllustrationSection(size: screenSize),
          _BottomContentSection(size: screenSize, textTheme: textTheme),
        ],
      ),
    );
  }
}

/// The top section of the screen containing the main illustration with
/// a gradient overlay at the bottom
class _TopIllustrationSection extends StatelessWidget {
  final Size size;
  static const double _illustrationHeightRatio = 0.6;
  static const double _gradientHeightRatio = 0.25;
  static const double _logoTopPositionRatio = 0.3; // 40% from top
  static const double _logoHeight = 150;

  const _TopIllustrationSection({required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * _illustrationHeightRatio,
      width: size.width,
      child: const Stack(
        children: [
          _OptimizedIllustration(),
          _BottomGradientOverlay(),
          _AppLogoOverlay(),
        ],
      ),
    );
  }
}

/// Displays the app logo centered at the top of the illustration with brand text
class _AppLogoOverlay extends StatelessWidget {
  static const String _logoAsset = 'assets/app_logo.png';
  static const double _logoPadding = 20;
  static const double _logoTextSpacing = 8;
  static const String _brandText = 'W I Z H';
  static const double _brandTextSize = 32;

  const _AppLogoOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * 
          _TopIllustrationSection._logoTopPositionRatio,
      left: _logoPadding,
      right: _logoPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            _logoAsset,
            height: _TopIllustrationSection._logoHeight,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: _logoTextSpacing),
          Text(
            _brandText,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color:AppColor.primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: _brandTextSize,
                  letterSpacing: 2,
                ),
          ),
        ],
      ),
    );
  }
}

/// A gradient overlay that fades from white to transparent at the bottom
/// of the illustration
class _BottomGradientOverlay extends StatelessWidget {
  static const _gradientColors = [
    Colors.white,
    Color.fromARGB(204, 255, 255, 255), // 80% opacity white
    Colors.transparent,
  ];
  static const _gradientStops = [0.0, 0.3, 1.0];

  const _BottomGradientOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height *
            _TopIllustrationSection._gradientHeightRatio,
        width: MediaQuery.sizeOf(context).width,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _gradientColors,
              stops: _gradientStops,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
          ),
        ),
      ),
    );
  }
}

/// An optimized illustration asset with proper caching
class _OptimizedIllustration extends StatelessWidget {
  static const _assetPath = "assets/get_started.png";

  const _OptimizedIllustration();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _assetPath,
      fit: BoxFit.cover,
      cacheWidth: MediaQuery.sizeOf(context).width.ceil(),
    );
  }
}

/// The bottom content section containing text and action buttons
class _BottomContentSection extends StatelessWidget {
  final Size size;
  final TextTheme textTheme;
  static const _contentPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 24,
  );

  const _BottomContentSection({
    required this.size,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: _contentPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _MainHeading(textTheme: textTheme),
            _Subheading(textTheme: textTheme),
            const _GetStartedButton(),
            const _SignInPrompt(),
          ],
        ),
      ),
    );
  }
}

/// The main heading text widget
class _MainHeading extends StatelessWidget {
  final TextTheme textTheme;
  static const _headingText = "Discover Best\nPlace to Vacation";

  const _MainHeading({required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Text(
      _headingText,
      style: textTheme.headlineLarge,
      textAlign: TextAlign.center,
    );
  }
}

/// The subheading text widget
class _Subheading extends StatelessWidget {
  final TextTheme textTheme;
  static const _subheadingText =
      "Travel around the world with just a tap\nand enjoy your holiday.";

  const _Subheading({required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Text(
      _subheadingText,
      style: textTheme.bodyMedium,
      textAlign: TextAlign.center,
    );
  }
}

/// The primary action button that starts the user journey
class _GetStartedButton extends StatelessWidget {
  static const _buttonHeight = 56.0;
  static const _buttonText = "GET STARTED";

  const _GetStartedButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: _buttonHeight,
      child: ElevatedButton(
        onPressed: () => _navigateToHome(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          _buttonText,
          style: TextStyle(color: AppColor.white),
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRouteName.home);
  }
}

/// The secondary action text prompting existing users to sign in
class _SignInPrompt extends StatelessWidget {
  static const _promptText = "Already have an account? ";
  static const _actionText = "Sign in";

  const _SignInPrompt();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _promptText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextSpan(
            text: _actionText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
          )
        ],
      ),
    );
  }
}