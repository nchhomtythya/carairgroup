import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    mapboxgl.accessToken = 'pk.eyJ1IjoibmN0eXRoeWEiLCJhIjoiY2w5cGF3a2cyMDRvdTNudDI1bW0yemp2MSJ9.TZbBXtnz2xRB0st1zp-I4A';
    this.map = new mapboxgl.Map({
    container: this.element,
    style: 'mapbox://styles/mapbox/streets-v12', // style URL
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))

  }



  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 200 })
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window) // Add this

      // Create a HTML element for your custom marker
    const customMarker = document.createElement("div")
    customMarker.className = "marker"
    customMarker.style.backgroundImage = `url('${marker.image_url}')`
    customMarker.style.backgroundSize = "contain"
    customMarker.style.width = "25px"
    customMarker.style.height = "25px"

    new mapboxgl.Marker(customMarker)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // Add this
      .addTo(this.map)
    })
  }
}
