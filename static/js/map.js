document.addEventListener('DOMContentLoaded', function() {
  if (!document.getElementById('map') || typeof climbs === 'undefined') return;

  var map = L.map('map').setView([57.0, -5.0], 7);

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
    maxZoom: 16
  }).addTo(map);

  var climbIcon = L.divIcon({
    className: '',
    html: '<div class="climb-marker"></div>',
    iconSize: [16, 16],
    iconAnchor: [8, 8],
    popupAnchor: [0, -10]
  });

  var cluster = L.markerClusterGroup({
    zoomToBoundsOnClick: false,
    maxClusterRadius: 40
  });

  cluster.on('clusterclick', function(e) {
    e.layer.spiderfy();
  });

  climbs.forEach(function(climb) {
    var marker = L.marker([climb.latitude, climb.longitude], { icon: climbIcon });

    var popup = '<strong><a href="' + climb.url + '">' + climb.title + '</a></strong>';
    if (climb.grade) popup += '<br>' + climb.grade;
    if (climb.location) popup += '<br><em>' + climb.location + '</em>';
    if (climb.date) popup += '<br>' + climb.date;

    marker.bindPopup(popup);
    marker.on('mouseover', function() { this.openPopup(); });
    cluster.addLayer(marker);
  });

  map.addLayer(cluster);
});
