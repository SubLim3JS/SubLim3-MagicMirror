/* MagicMirror²
 * Module: Compliments
 *
 * By Michael Teeuw https://michaelteeuw.nl
 * MIT Licensed.
 */
Module.register("compliments", {
	// Module config defaults.
	defaults: {
		compliments: {
				"....-01-01": [
				"Happy new year!"
				],
				"....-10-31": [
				"Happy Halloween!"
				],
				"....-09-16": [
				"Happy Birthday Jason!"
				],
				"....-07-11": [
				"Happy Birthday Thomas!"
				],
				"....-11-09": [
				"Happy Birthday Ben!"
				],
			anytime: [
   				"You're Awesome!",
   				"Perfect!",
   				"You're someone's reason to smile.",
   				"I like your style.",
   				"You were cool before hipsters were cool.",
   				"Your potential is limitless.",
   				"You light up the room.",
   				"Looking Good!",
   				"A smile is contagious.",
				"Damn you look good!",
				"What's Up Good Looking?",
				"Hello, beautiful!",
				"You are making a difference.",
				"Wow, you look hot!",
				"You look nice!",
				"Hey, sexy!",
				"You look sexy!",
				"Looking good today!",
				"Hey There Sexy!"
			],
			morning: [
				"Good morning, sunshine!",
				"Who needs coffee when you have your smile?",
				"Go get 'em, Tiger!",
				"Good morning, handsome!",
				"Enjoy your day!",
				"How was your sleep?"
			],
			afternoon: [
				"Hitting your stride!",
				"You are making a difference!",
				"You're more fun than bubble wrap!"
			],
			evening: [
				"Gonna be an Early Night?",
				"You made someone smile today, I know it.",
				"The day was better for your efforts."
			],
			"day_sunny" : [
				"Today is a sunny day.",
				"Let it shine.",
				"It's a beautiful day."
			],
			"snow" : [
				"Snowball Fight!?",
				"Hope you're wearing a One-Zee",
				"Yep, that's Snow?"
			],
			"night_snow" : [
				"Snowball Fight!?",
				"Hope you're wearing a One-Zee",
				"Yep, that's Snow?"
			],
			"thunderstorm" : [
				"And the Thunder Rolls",
				"And the Lightning Strikes",
				"Gonna Sleep Good Tonight!"
			],
			"night_thunderstorm" : [
				"And the Thunder Rolls",
				"And the Lightning Strikes",
				"Gonna Sleep Good Tonight!"
			],
			"showers" : [
				"It's just a sprinkle.",
				"A little rain never hurt, right?"
			],
			"night_showers" : [
				"It's just a sprinkle.",
				"A little rain never hurt, right?"
			],
			"rain" : [
				"Don't forget your umbrella",
				"You're like sunshine on a rainy day.",
				"Rain Rain, Go Away."
			],
			"night_rain" : [
				"Don't forget your umbrella",
				"You're like sunshine on a rainy day.",
				"Rain Rain, Go Away."
			],
			"night_clear" : [
				"Check out those Stars",
				"It's a good night for star gazing."
			]
		},
		updateInterval: 10000,
		remoteFile: null,
		fadeSpeed: 4000,
		morningStartTime: 4,
		morningEndTime: 12,
		afternoonStartTime: 12,
		afternoonEndTime: 17
	},
	lastIndexUsed: -1,
	// Set currentweather from module
	currentWeatherType: "",

	// Define required scripts.
	getScripts () {
		return ["moment.js"];
	},

	// Define start sequence.
	async start () {
		Log.info(`Starting module: ${this.name}`);

		this.lastComplimentIndex = -1;

		if (this.config.remoteFile !== null) {
			const response = await this.loadComplimentFile();
			this.config.compliments = JSON.parse(response);
			this.updateDom();
		}

		// Schedule update timer.
		setInterval(() => {
			this.updateDom(this.config.fadeSpeed);
		}, this.config.updateInterval);
	},

	/**
	 * Generate a random index for a list of compliments.
	 * @param {string[]} compliments Array with compliments.
	 * @returns {number} a random index of given array
	 */
	randomIndex (compliments) {
		if (compliments.length === 1) {
			return 0;
		}

		const generate = function () {
			return Math.floor(Math.random() * compliments.length);
		};

		let complimentIndex = generate();

		while (complimentIndex === this.lastComplimentIndex) {
			complimentIndex = generate();
		}

		this.lastComplimentIndex = complimentIndex;

		return complimentIndex;
	},

	/**
	 * Retrieve an array of compliments for the time of the day.
	 * @returns {string[]} array with compliments for the time of the day.
	 */
	complimentArray () {
		const hour = moment().hour();
		const date = moment().format("YYYY-MM-DD");
		let compliments = [];

		// Add time of day compliments
		if (hour >= this.config.morningStartTime && hour < this.config.morningEndTime && this.config.compliments.hasOwnProperty("morning")) {
			compliments = [...this.config.compliments.morning];
		} else if (hour >= this.config.afternoonStartTime && hour < this.config.afternoonEndTime && this.config.compliments.hasOwnProperty("afternoon")) {
			compliments = [...this.config.compliments.afternoon];
		} else if (this.config.compliments.hasOwnProperty("evening")) {
			compliments = [...this.config.compliments.evening];
		}

		// Add compliments based on weather
		if (this.currentWeatherType in this.config.compliments) {
			Array.prototype.push.apply(compliments, this.config.compliments[this.currentWeatherType]);
		}

		// Add compliments for anytime
		Array.prototype.push.apply(compliments, this.config.compliments.anytime);

		// Add compliments for special days
		for (let entry in this.config.compliments) {
			if (new RegExp(entry).test(date)) {
				Array.prototype.push.apply(compliments, this.config.compliments[entry]);
			}
		}

		return compliments;
	},

	/**
	 * Retrieve a file from the local filesystem
	 * @returns {Promise} Resolved when the file is loaded
	 */
	async loadComplimentFile () {
		const isRemote = this.config.remoteFile.indexOf("http://") === 0 || this.config.remoteFile.indexOf("https://") === 0,
			url = isRemote ? this.config.remoteFile : this.file(this.config.remoteFile);
		const response = await fetch(url);
		return await response.text();
	},

	/**
	 * Retrieve a random compliment.
	 * @returns {string} a compliment
	 */
	getRandomCompliment () {
		// get the current time of day compliments list
		const compliments = this.complimentArray();
		// variable for index to next message to display
		let index;
		// are we randomizing
		if (this.config.random) {
			// yes
			index = this.randomIndex(compliments);
		} else {
			// no, sequential
			// if doing sequential, don't fall off the end
			index = this.lastIndexUsed >= compliments.length - 1 ? 0 : ++this.lastIndexUsed;
		}

		return compliments[index] || "";
	},

	// Override dom generator.
	getDom () {
		const wrapper = document.createElement("div");
		wrapper.className = this.config.classes ? this.config.classes : "thin xlarge bright pre-line";
		// get the compliment text
		const complimentText = this.getRandomCompliment();
		// split it into parts on newline text
		const parts = complimentText.split("\n");
		// create a span to hold the compliment
		const compliment = document.createElement("span");
		// process all the parts of the compliment text
		for (const part of parts) {
			if (part !== "") {
				// create a text element for each part
				compliment.appendChild(document.createTextNode(part));
				// add a break
				compliment.appendChild(document.createElement("BR"));
			}
		}
		// only add compliment to wrapper if there is actual text in there
		if (compliment.children.length > 0) {
			// remove the last break
			compliment.lastElementChild.remove();
			wrapper.appendChild(compliment);
		}
		return wrapper;
	},

	// Override notification handler.
	notificationReceived (notification, payload, sender) {
		if (notification === "CURRENTWEATHER_TYPE") {
			this.currentWeatherType = payload.type;
		}
	}
});
