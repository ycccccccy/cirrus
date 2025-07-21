import 'package:flutter/material.dart';

/// Cirrus 设计系统中的步骤指示器。
///
/// 包含优雅的步骤切换动画和状态变化效果。
class CirrusStepper extends StatelessWidget {
  final List<Step> steps;
  final int currentStep;
  final StepperType type;
  final ControlsWidgetBuilder? controlsBuilder;
  final void Function(int)? onStepTapped;

  const CirrusStepper({
    super.key,
    required this.steps,
    this.currentStep = 0,
    this.type = StepperType.vertical,
    this.controlsBuilder,
    this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: steps,
      currentStep: currentStep,
      type: type,
      controlsBuilder: controlsBuilder,
      onStepTapped: onStepTapped,
      // 样式会从 ThemeData 中获取
      // 包含了内置的步骤切换动画效果
    );
  }
}
