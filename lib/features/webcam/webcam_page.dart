import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_cubit.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

class WebcamPage extends StatefulWidget {
  const WebcamPage({super.key});

  @override
  State<WebcamPage> createState() => _WebcamPageState();
}

class _WebcamPageState extends State<WebcamPage> {
  late final InAppWebViewController _controller;

  @override
  void initState() {
    super.initState();
  }

  void _onWebViewCreated(InAppWebViewController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    final initialRequest = context.read<MountainCubit>().state.selectedMountain.webcamUrl;

    return BlocListener<MountainCubit, MountainState>(
      listenWhen: (previous, current) {
        return previous.selectedMountain.webcamUrl != current.selectedMountain.webcamUrl;
      },
      listener: (context, state) {
        _controller.loadUrl(urlRequest: URLRequest(url: WebUri(state.selectedMountain.webcamUrl)));
      },
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(initialRequest)),
        onWebViewCreated: (controller) => _onWebViewCreated(controller),
      ),
    );
  }
}
