library(rvest)

# Trailforks Top Riding Areas in the US.
url = 'http://www.trailforks.com/region/united-states/ridingareas/?sort=r.views&order=desc'


['McKenzie River Trail (Eugene)', 'Alpine Trail (Oakridge)'
 'Sandy Ridge (Sandy)', 'Tiddlywinks (Bend)', 'Blackrock (Falls City)', 
 'North Umqua (Roseburg)', 
 'Cape Mountain (Florence)', 'Newburry Crater Rim (La Pine)', 'Alsea Falls (Alsea)',
 'Funner (Bend)', 'Waldo Lake (Oakridge)', "Mary's Peak (Philomath)", 'Tire Mountain (Westfir)', 
 'Hardesty Mountain (Lowell)', "Ben's Upper (Bend)",'Post Canyon (Hood River)', 
 "Phil's Area Trail (Bend)", "Tyler's Traverse (Bend)", 'Whoops (Bend)']


var infowindow = new google.maps.InfoWindow();

var marker, i;

for (i = 0; i < locations.length; i++) {
  marker = new google.maps.Marker({
    position: new google.maps.address(optimal_route[i]),
    map: map
  });
  
  google.maps.event.addListener(marker, 'click', (function(marker, i) {
    return function() {
      infowindow.setContent(locations[i]);
      infowindow.open(map, marker);
    }
  })(marker, i));
  createRoutes(optimal_route);