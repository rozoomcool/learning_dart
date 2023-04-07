class TransformState {
  double _offsetX;
  double _offsetY;
  double _scale;

  TransformState(this._offsetX, this._offsetY, this._scale);

  TransformState updateOffset(double x, double y) {
    _offsetX += x;
    _offsetY += y;

    return TransformState(_offsetX, _offsetY, _scale);
  }

  double get offsetY => _offsetY;

  double get offsetX => _offsetX;

  double get scale => _scale;
}