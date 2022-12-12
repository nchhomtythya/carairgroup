// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { initFlatPickr } from "./plugins/init_flatpickr"


initFlatPickr();
