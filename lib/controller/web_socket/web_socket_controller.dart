import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketController {
  final String url = 'wss://echo.websocket.org';
  WebSocketChannel? _channel;
  StreamController<dynamic> _controller = StreamController<dynamic>();

  WebSocketController();

  // Connect to the WebSocket server
  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _channel?.stream.listen(
      (data) {
        _controller.add(data);
      },
      onDone: () {
        print('WebSocket connection closed');
        _controller.add(null); // Indicate connection is closed
      },
      onError: (error) {
        print('WebSocket error: $error');
        _controller.addError(error);
      },
    );
  }

  // Disconnect from the WebSocket server
  void disconnect() {
    _channel?.sink.close();
    _channel = null;
    _controller.close();
  }

  // Listen to incoming data from the WebSocket
  Stream<dynamic> get stream => _controller.stream;

  // Sink data to the WebSocket
  void send(dynamic data) {
    if (_channel != null) {
      _channel?.sink.add(data);
    } else {
      print('WebSocket is not connected');
    }
  }

  // Check if WebSocket is connected
  bool get isConnected => _channel != null;

  // Reconnect the WebSocket
  void reconnect() {
    disconnect();
    _controller = StreamController<dynamic>();
    connect();
  }
}
