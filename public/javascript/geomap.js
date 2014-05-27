var map;
var geocoder;
var markersArray = [];
var destinationIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=D|FF0000|000000';
var originIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=O|FFFF00|000000';
var bounds = new google.maps.LatLngBounds();
function initialize() {

    GeocoderRequest = {
        address: "Taganrog"
    }
    var myLatlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
        zoom: 8,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    geocoder = new google.maps.Geocoder();
    document.write(document.cookie);

//        geocoder.geocode(GeocoderRequest, function(GeocoderResult, GeocoderStatus){
//            if (status == google.maps.GeocoderStatus.OK)
//            console.log("GeocoerResult", GeocoderResult);
//            console.log("GeocoderStatus", GeocoderStatus);
////        })
//    addMarker("Taganrog");
//    addMarker("Moscow");

}
function calculateDistances() {
    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix(
        {
            origins: ["Ростов-на-дону"],
            destinations: ["Москва", "Таганрог", "Воронеж"],
            travelMode: google.maps.TravelMode.DRIVING,
            unitSystem: google.maps.UnitSystem.METRIC,
            avoidHighways: false,
            avoidTolls: false
        }, callback);
}

function callback(response, status) {
    if (status != google.maps.DistanceMatrixStatus.OK) {
        alert('Error was: ' + status);
    } else {
        var origins = response.originAddresses;
        var destinations = response.destinationAddresses;
        var outputDiv = document.getElementById('outputDiv');
        var outputServer = [];
        outputDiv.innerHTML = '';
        deleteOverlays();

        for (var i = 0; i < origins.length; i++) {
            var results = response.rows[i].elements;
            addMarker(origins[i], false);
            for (var j = 0; j < results.length; j++) {
                addMarker(destinations[j], true);
                outputServer[j] = {
                    'origins'       : origins[i],
                    'destinations'  : destinations[j],
                    'distance'      : results[j].distance.text,
                    'duration'      : results[j].duration.text
                }
                outputDiv.innerHTML += origins[i] + ' to ' + destinations[j]
                    + ': ' + results[j].distance.text + ' in '
                    + results[j].duration.text + '<br>';
            }
        }
        console.log("outputServer", outputServer);
        console.log("response", response.rows[0].elements);
//            console.log("destinations", destinations);
    }
}

function addMarker(location, isDestination) {
    var icon;
    if (isDestination) {
        icon = destinationIcon;
    } else {
        icon = originIcon;
    }
    geocoder.geocode({'address': location}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            bounds.extend(results[0].geometry.location);
            map.fitBounds(bounds);

            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location,
                icon: icon
            });
            markersArray.push(marker);
        } else {
            alert('Geocode was not successful for the following reason: '
                + status);
        }
    });
}
function deleteOverlays() {
    for (var i = 0; i < markersArray.length; i++) {
        markersArray[i].setMap(null);
    }
    markersArray = [];
}


window.onload = function() {
    initialize();
    calculateDistances();

}