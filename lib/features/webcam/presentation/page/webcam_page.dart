import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_cubit.dart';
import 'package:snowcast/features/webcam/presentation/bloc/webcam_cubit.dart';
import 'package:snowcast/features/webcam/presentation/bloc/webcam_state.dart';
import 'package:snowcast/features/webcam/presentation/widget/states/webcam_error_state.dart';
import 'package:snowcast/features/webcam/presentation/widget/states/webcam_loading_state.dart';

class WebcamPage extends StatelessWidget {
  const WebcamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WebcamCubit(),
      child: const WebcamView(),
    );
  }
}

class WebcamView extends StatefulWidget {
  const WebcamView({super.key});

  @override
  State<WebcamView> createState() => _WebcamViewState();
}

class _WebcamViewState extends State<WebcamView> {
  InAppWebViewController? _controller;
  bool _isInitialLoad = true;

  @override
  Widget build(BuildContext context) {
    final mountainState = context.watch<MountainCubit>().state;
    final webcamState = context.watch<WebcamCubit>().state;

    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(mountainState.selectedMountain.webcamUrl)),
          onWebViewCreated: (controller) {
            _controller = controller;
            context.read<WebcamCubit>().setLoading();
          },
          onLoadStart: (controller, url) {
            if (_isInitialLoad) {
              context.read<WebcamCubit>().setLoading();
            }
          },
          onLoadStop: (controller, url) {
            _isInitialLoad = false;
            context.read<WebcamCubit>().setLoaded();
          },
          onReceivedError: (controller, request, error) {
            _isInitialLoad = false;
            context.read<WebcamCubit>().setError();
          },
        ),
        _WebcamStateOverlay(
          state: webcamState,
          onRetry: () {
            _isInitialLoad = true;
            context.read<WebcamCubit>().setLoading();
            _controller?.reload();
          },
        ),
      ],
    );
  }
}

class _WebcamStateOverlay extends StatelessWidget {
  const _WebcamStateOverlay({
    required this.state,
    required this.onRetry,
  });

  final WebcamState state;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case WebcamStatus.initial:
      case WebcamStatus.loaded:
        return const SizedBox.shrink();
      case WebcamStatus.loading:
        return const WebcamLoadingState();
      case WebcamStatus.error:
        return WebcamErrorState(onRetry: onRetry);
    }
  }
}
