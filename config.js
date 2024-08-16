/* MagicMirror² Config Sample
 *
 * By Michael Teeuw https://michaelteeuw.nl
 * MIT Licensed.
 *
 * For more information on how you can configure this file
 * see https://docs.magicmirror.builders/configuration/introduction.html
 * and https://docs.magicmirror.builders/modules/configuration.html
 *
 * You can use environment variables using a `config.js.template` file instead of `config.js`
 * which will be converted to `config.js` while starting. For more information
 * see https://docs.magicmirror.builders/configuration/introduction.html#enviromnent-variables
 */
let config = {
	address: "0.0.0.0",	// Address to listen on, can be:
							// - "localhost", "127.0.0.1", "::1" to listen on loopback interface
							// - another specific IPv4/6 to listen on a specific interface
							// - "0.0.0.0", "::" to listen on any interface
							// Default, when address config is left out or empty, is "localhost"
	port: 8080,
	basePath: "/",	// The URL path where MagicMirror² is hosted. If you are using a Reverse proxy
									// you must set the sub path here. basePath must end with a /
	ipWhitelist: [],	// Set [] to allow all IP addresses
									// or add a specific IPv4 of 192.168.1.5 :
									// ["127.0.0.1", "::ffff:127.0.0.1", "::1", "::ffff:192.168.1.5"],
									// or IPv4 range of 192.168.3.0 --> 192.168.3.15 use CIDR format :
									// ["127.0.0.1", "::ffff:127.0.0.1", "::1", "::ffff:192.168.3.0/28"],

	useHttps: false,			// Support HTTPS or not, default "false" will use HTTP
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
			module: 'MMM-ModuleScheduler'
		},
		{
			module: "MMM-Carousel",
			position: "bottom_bar",
			config: {
				transitionInterval: 10000,
				ignoreModules: [],
				mode: "positional",
				top_left: {
					 enabled: true,
                                        ignoreModules: ["clock"],
                                        overrideTransitionInterval: 10000
                                        },
				bottom_bar: {
					enabled: true,
					ignoreModules: [],
					overrideTransitionInterval: 30000
					},
				},
		},
		{
			module: "updatenotification",
			position: "top_bar"
		},
		{
			module: "clock",
			position: "top_left",
			config: {
				displaySeconds: false,
				},
		},
		{
			module: "calendar",
			header: "US Holidays",
			position: "top_left",
			config: {
                                fade: false,
                                maxTitleLength: 25,
				maximumEntries: 5,
				calendars: [
					{
						fetchInterval: 7 * 24 * 60 * 60 * 1000,
						symbol: "calendar-day",
						url: "https://ics.calendarlabs.com/76/mm3137/US_Holidays.ics"
					}
				]
			}
		},
                {
                        module: 'MMM-GoogleCalendar',
                        header: "Jason's Calendar",
                        position: "top_left",
                        config: {
				maxTitleLength: 25,
				coloredSymbolOnly: true,
				customEvents: [
						{keyword: 'bills', symbol: 'dollar-sign', color: 'Green'},
						{keyword: 'dentist', symbol: 'tooth'},
                                                {keyword: 'clarity', symbol: 'brain', color: 'Purple'}
						],
				maximumEntries: 5,
	                        calendars: [
                                        {
                                        symbol: "calendar-days",
                                        calendarID: "sublim3.js@gmail.com"
                                        },
                                // add another calendar HERE if needed
                                   ],
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
				weatherProvider: "openweathermap",
				type: "current",
				location: "Clarksville TN",
				locationID: "4613868", //ID from http://bulk.openweathermap.org/sample/city.list.json.gz; unzip the gz file and find your city
				apiKey: "a253ff0b2af61c54582dbb1388bfb796"
			}
		},
		{
			module: "weather",
			position: "top_right",
			header: "Weather Forecast",
			config: {
				fade: false,
				weatherProvider: "openweathermap",
				type: "forecast",
				location: "Clarksville TN",
				locationID: "4613868", //ID from http://bulk.openweathermap.org/sample/city.list.json.gz; unzip the gz file and find your city
				apiKey: "a253ff0b2af61c54582dbb1388bfb796"
			}
		},
  		{
			module: 'MMM-Remote-Control',
			// uncomment the following line to show the URL of the remote control on the mirror
			// position: 'top_left',
			// you can hide this module afterwards from the remote control itself
			config: {
				showModuleApiMenu: true,
				apiKey: 'b6a687758bd642d685b197f1b7bc02d6'
				}
		},
		{
			module: "MMM-Remote-Control-Repository",
		},
		{
			module: 'MMM-PIR-Sensor',
		config: {
			sensorPin: 23,
			},
		},
		{
			module: "MMM-MoonPhase",
			position: "top_right",
			config: {
				updateInterval: 4320000,
				hemisphere: "N",
				resolution: "detailed",
				basicColor: "white",
				title: true,
				phase: true,
				x: 150,
				y: 150,
				alpha: 0.7
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
					/*{
						title: "New York Times",
						url: "https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml"
					}*/
				],
				updateInterval: 5000,
				showSourceTitle: true,
				showPublishDate: true,
				broadcastNewsFeeds: true,
				broadcastNewsUpdates: true
			}
		},
                {
                        module: 'MMM-DailyBibleVerse',
                        position: 'bottom_bar', // This can be any of the regions. Best result is in the bottom_bar >
                        config: {
                                version: 'ESV', // This can be changed to any version you want that is offered by Bi>
                                size: 'small' // default value is medium, but can be changed.
                                }
                },
/*		{
			module: "MMM-GooglePhotos",
			position: "top_center",
			config: {
			    albums: ["Photo Frame"], // Set your album name. like ["My wedding", "family share", "Travle to Paris"]
			    updateInterval: 600 * 60, // minimum 10 seconds.
			    sort: "random", // "old", "random"
			    uploadAlbum: null, // Only album created by `create_uploadable_album.js`.
			    condition: {
			      fromDate: null, // Or "2018-03", RFC ... format available
			      toDate: null, // Or "2019-12-25",
			      minWidth: 300, // Or 400
			      maxWidth: 500, // Or 8000
			      minHeight: 300, // Or 400
			      maxHeight: 500, // Or 8000
			      minWHRatio: null,
			      maxWHRatio: null,
			      // WHRatio = Width/Height ratio ( ==1 : Squared Photo,   < 1 : Portraited Photo, > 1 : Landscaped Photo)
			    },
			    showWidth: 1080, // These values will be used for quality of downloaded photos to show. real size to show in your MagicMirror region is recommended.
			    showHeight: 1920,
			    timeFormat: "YYYY/MM/DD HH:mm", // Or `relative` can be used.
			    }
		},*/
		{
			module: 'MMM-Screencast',
			position: 'bottom_right', // This position is for a hidden <div /> and not the screencast window
			config: {
				position: 'top_center',
				castName: 'MagicMirror',
				height: 600,
				width: 1000,
				}
		},
	]
};

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== "undefined") { module.exports = config; }
