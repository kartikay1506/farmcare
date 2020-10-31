ListItem dropDown1;
ListItem dropDown2;
String previousCrop = "", farmArea, machinery;

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

String longitude, latitude;
String finaladdress;

var result = {
  "crops": {"0": "wheat", "1": "millet"},
  "crop_info": {
    "0":
        "Wheat is a cereal grain. People eat it most often in the form of bread. It is a kind of grass whose fruit is a \"head of wheat\" with edible seeds. World trade in wheat is greater than for all other crops combined",
    "1":
        "Millets are a group of highly variable small-seeded grasses, widely grown around the world as cereal crops or grains for fodder and human food.Generally, millets are small-grained, annual, warm-weather cereals belonging to the grass family. They are highly tolerant of drought and other extreme weather conditions and have a similar nutrient content to other major cereals."
  },
  "soil_type": {"0": "Loamy and clay soil", "1": "Sandy loam soil."},
  "temperature_req": {
    "0": "12\u00b0 to 25\u00b0C",
    "1": "25\u00b0 to 30\u00b0C"
  },
  "water_req": {"0": "450-650 mm\/day", "1": "450-650 mm\/day"},
  "time_required": {"0": "7-8 months", "1": "105-140 days"},
  "seeds_per_hectare": {
    "0":
        "125 kg\/hectare normal grain 150 kg\/hectare for bold grain, Distance between rows: 18-20cm in normal condition and 5cm deep. In case of late sowing: 15-18cm and 4cm deep.",
    "1": "8-12 kg\/hectare"
  },
  "MSP": {
    "0": "Rs 1,975 per quintal",
    "1": "Rs 1,871 per quintal",
  },
};

List<String> images = [
  "http://www.pngall.com/wp-content/uploads/2/Wheat-PNG-Image.png",
  "https://megoindia.com/wp-content/uploads/2019/07/millets-benefits-page.png"
];
