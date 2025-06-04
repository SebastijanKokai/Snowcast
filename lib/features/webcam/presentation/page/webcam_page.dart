import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_cubit.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/webcam/presentation/bloc/webcam_cubit.dart';
import 'package:snowcast/features/webcam/presentation/bloc/webcam_state.dart';
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
    final mountainState = context.read<MountainCubit>().state;
    final webcamState = context.read<WebcamCubit>().state;

    return BlocListener<MountainCubit, MountainState>(
      listenWhen: (previous, current) => previous.selectedMountain != current.selectedMountain,
      listener: (context, state) {
        _isInitialLoad = true;
        context.read<WebcamCubit>().setLoading();
        _controller?.loadUrl(urlRequest: URLRequest(url: WebUri(state.selectedMountain?.webcamUrl ?? '')));
      },
      child: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(mountainState.selectedMountain?.webcamUrl ?? '')),
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
          ),
          if (webcamState.status == WebcamStatus.loading) const WebcamLoadingState(),
        ],
      ),
    );
  }
}
