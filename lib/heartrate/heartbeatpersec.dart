
import 'package:flutter/material.dart';
import 'package:flutter_better_camera/camera.dart';
import 'package:wakelock/wakelock.dart';
import 'chart.dart';
import 'package:semeter_project_health_app/useddata.dart';


class HeartBPM extends StatefulWidget {
  @override
  HeartBPMView createState() {
    return HeartBPMView();
  }
}

class HeartBPMView extends State<HeartBPM> {
  double _alpha = 0.3;
  bool _toggled = false;
  bool _processing = false;
  List<SensorValue> _data = [];
  CameraController _controller;
  int _bpm = 0;
  var tempbpm = BPM(bpm: 1);

  bool get process {
    return _processing;
  }
  bool get tog {
    return _toggled;
  }

  Future<void> _initController() async {
    try {
      List _cameras = await availableCameras();
      _controller = CameraController(_cameras.first, ResolutionPreset.low);
      await _controller.initialize();
      Future.delayed(Duration(milliseconds: 500)).then((onValue) {
        _controller.setFlashMode(FlashMode.torch);
      });
      _controller.startImageStream((CameraImage image) {
        if (!_processing) {
          setState(() {
            _processing = true;
          });
          _scanImage(image);
        }
      });
    } catch (Exception) {
      print(Exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: _controller == null
                          ? Container(
                         child: Text(
                             'Placing Finger Under the Camera after Tap',
                           textAlign: TextAlign.center,
                           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      )
                          : CameraPreview(_controller),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        color: Colors.red),
                        child:Center(
                        child: Text(
                          (_bpm > 30 && _bpm < 150 ? 'Beats P/M \n' + _bpm.round().toString() : "Beats P/M \n --"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(_toggled ? Icons.favorite : Icons.favorite_border),
                      color: Colors.red,
                      iconSize: 128,
                      onPressed: () {
                        if (_toggled) {
                          _untoggle();
                        } else {
                          _toggle();
                        }
                      },
                    ),
                    Text(
                      "Tap Heart to Start",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    color: Colors.black),
                child: Chart(_data),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _toggle() {
    _initController().then((onValue) {
      Wakelock.enable();
      setState(() {
        _toggled = true;
        _processing = false;
      });
      _updateBPM();
    });
  }

  _untoggle() {
    tempbpm = BPM(bpm: this._bpm);
    _disposeController();
    Wakelock.disable();
    setState(() {
      _toggled = false;
      _processing = false;
    });
  }

  _disposeController() {
    _controller.dispose();
    _controller = null;
  }

  _scanImage(CameraImage image) {
    double _avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;
    if (_data.length >= 50) {
      _data.removeAt(0);
    }
    setState(() {
      _data.add(SensorValue(DateTime.now(), _avg));
    });
    Future.delayed(Duration(milliseconds: 1000 ~/ 30)).then((onValue) {
      setState(() {
        _processing = false;
      });
    });
  }

  _updateBPM() async {
    List<SensorValue> _values;
    double _avg;
    int _n;
    double _m;
    double _threshold;
    double _bpm;
    int _counter;
    int _previous;
    while (_toggled) {
      _values = List.from(_data);
      _avg = 0;
      _n = _values.length;
      _m = 0;
      _values.forEach((SensorValue value) {
        _avg += value.value / _n;
        if (value.value > _m) _m = value.value;
      });
      _threshold = (_m + _avg) / 2;
      _bpm = 0;
      _counter = 0;
      _previous = 0;
      for (int i = 1; i < _n; i++) {
        if (_values[i - 1].value < _threshold &&
            _values[i].value > _threshold) {
          if (_previous != 0) {
            _counter++;
            _bpm +=
                60000 / (_values[i].time.millisecondsSinceEpoch - _previous);
          }
          _previous = _values[i].time.millisecondsSinceEpoch;
        }
      }
      if (_counter > 0) {
        _bpm = _bpm / _counter;
        setState(() {
          this._bpm = ((1 - _alpha) * _bpm + _alpha * _bpm).toInt();
        });
      }
      await Future.delayed(Duration(milliseconds: (1000 * 50 / 30).round()));
    }
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }


}




