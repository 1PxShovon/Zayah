Stream<Position> getLiveLocation() {
  return Geolocator.getPositionStream();
}