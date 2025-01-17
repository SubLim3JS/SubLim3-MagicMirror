/*
 *
 * For more information on how you can configure this file
 * reference the SubLim3 MagicMirror GitHub.
 * https://github.com/SubLim3JS/SubLim3-MagicMirror 
 *
 */
let config = {
	address: "0.0.0.0",	// Address to listen on, can be:
				// - "localhost", "127.0.0.1", "::1" to listen on loopback interface
				// - another specific IPv4/6 to listen on a specific interface
				// - "0.0.0.0", "::" to listen on any interface
				// Default, when address config is left out or empty, is "localhost"
	port: 8080,
	basePath: "/",		// The URL path where MagicMirror² is hosted. If you are using a Reverse proxy
				// you must set the sub path here. basePath must end with a /
	ipWhitelist: [],	// Set [] to allow all IP addresses
				// or add a specific IPv4 of 192.168.1.5 :
				// ["127.0.0.1", "::ffff:127.0.0.1", "::1", "::ffff:192.168.1.5"],
				// or IPv4 range of 192.168.3.0 --> 192.168.3.15 use CIDR format :
				// ["127.0.0.1", "::ffff:127.0.0.1", "::1", "::ffff:192.168.3.0/28"],

	useHttps: false,	// Support HTTPS or not, default "false" will use HTTP
	httpsPrivateKey: "",	// HTTPS private key path, only require when useHttps is true
	httpsCertificate: "",	// HTTPS Certificate path, only require when useHttps is true

	language: "en",
	locale: "en-US",
	logLevel: ["INFO", "LOG", "WARN", "ERROR"], // Add "DEBUG" for even more logging
	timeFormat: 12,
	units: "imperial",

	modules: [
		{
			module: "alert",
		},
		{
			module: "updatenotification",
			position: "top_bar"
		},
		{
			module: "MMM-Carousel",
			position: "bottom_bar", // Required to draw in position
			config: {
				transitionInterval: 10000,
				ignoreModules: ["alert","clock","calendar","weather","compliments","MMM-Remote-Control"],
				mode: "positional",
				bottom_bar: { enabled: true, ignoreModules: [] },
				// top_right: { enabled: true, ignoreModules: ["weather"] }
				}
		},
		{
			module: 'MMM-DailyBibleVerse',
			position: 'bottom_bar',	// This can be any of the regions. Best result is in the bottom_bar as verses can take multiple lines in a day.
			config: {
				version: 'ESV', // This can be changed to any version you want that is offered by Bible Gateway. For a list, go here: https://www.biblegateway.com/versions/,
				size: 'small' // default value is medium, but can be changed. 
				}
		},
		{
			module: "clock",
			position: "top_left",
			config: {
				displaySeconds: false
				}
		},
		{
			module: "calendar",
			header: "US Holidays",
			position: "top_left",
			config: {
				maximumEntries: 6,
				fade: false,
				calendars: [
					{
						fetchInterval: 7 * 24 * 60 * 60 * 1000,
						symbol: "calendar-check",
						url: "https://ics.calendarlabs.com/76/mm3137/US_Holidays.ics"
					}
				]
			}
		},
		{
			module: "compliments",
			position: "lower_third"
		},
		{
			module: "weather",
			position: "top_right",
			config: {
				weatherProvider: "openmeteo",
				type: "current",
				lat: 36.3934,
				lon: -87.3872
			}
		},
		{
			module: "weather",
			position: "top_right",
			header: "Weather Forecast",
			config: {
				fade: false,
				weatherProvider: "openmeteo",
				type: "forecast",
				lat: 36.3934,
				lon: -87.3872
			}
		},
                {
                        module: "MMM-MoonPhase",
                        position: "top_right",
                        config: {
                                updateInterval: 43200000,
                                hemisphere: "N",
                                resolution: "detailed",
                                basicColor: "white",
                                title: true,
                                phase: true,
                                nextFull: false,
                                size: 200,
                                moonAlign: "center",
                                textAlign: "center",
                                alpha: 0.7,
                                riseAndSet: {
                                        display: false,
                                        lon: -80.0,
                                        lat: 40.0,
                                        gmtOffset: -3.0
                                        }
                                }
                },
		{
			module: 'MMM-SystemMonitor',
			position: 'top_left',
			config: {
				updateInterval: 60000,
				cpuThermalZone: 0,
				units: 'imperial'
				}
		},
		{
                        module: 'MMM-Remote-Control',
                        // uncomment the following line to show the URL of the remote control on the mirror
                        position: 'top_left',
                        // you can hide this module afterwards from the remote control itself
                        config: {
                        customCommand: {},  // Optional, See "Using Custom Commands" below
                        showModuleApiMenu: true, // Optional, Enable the Module Controls menu
                        secureEndpoints: true, // Optional, See API/README.md
                                // uncomment any of the lines below if you're gonna use it
                                // customMenu: "custom_menu.json",
                                        // Optional, See "Custom Menu Items" below
                        apiKey: "848a051b405e4eddb210765442efbe87",
                                        // Optional, See API/README.md for details
                                // classes: {} // Optional, See "Custom Classes" below
                                }
                },
                {
                        module: "MMM-Remote-Control-Repository",
                },

        {
		module: 'MMM-Screencast',
		position: 'bottom_right', // This position is for a hidden <div /> and not the screencast window
		config: {
			position: 'top_center',
			height: 600,
			width: 1000,
		}
        },
		{
			module: 'MMM-JokeAPI',
			position: 'bottom_bar',
			config: {
				category: "Any",
				fetchInterval: 12 * 1000
				}
		},
		{
			module: "newsfeed",
			position: "bottom_bar",
			config: {
				feeds: [
					{
						title: "Clarksville News",
						url: "https://www.clarksvilleonline.com/feed/rss2"
					}
				],
				showSourceTitle: true,
				showPublishDate: true,
				broadcastNewsFeeds: true,
				broadcastNewsUpdates: true
			}
		},
	]
};

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== "undefined") { module.exports = config; }
