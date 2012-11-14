var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "14400",
			ok: "7439",
			ko: "6961"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "14860",
			ok: "14860",
			ko: "1700"
		},
		meanResponseTime : {
			total: "4850",
			ok: "9331",
			ko: "61"
		},
		standardDeviation : {
			total: "5612",
			ok: "4408",
			ko: "59"
		},
		percentiles1 : {
			total: "13990",
			ok: "14290",
			ko: "200"
		},
		percentiles2 : {
			total: "14570",
			ok: "14680",
			ko: "270"
		},
		group1 : {
			name: "t < 800 ms",
			count: 471,
			percentage: 3
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 132,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 6836,
			percentage: 47
		},
		group4 : {
			name: "failed",
			count: 6961,
			percentage: 48
		},
		meanNumberOfRequestsPerSecond: {
			total: "157",
			ok: "81",
			ko: "76"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "4800",
			ok: "2619",
			ko: "2181"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "14810",
			ok: "14810",
			ko: "1700"
		},
		meanResponseTime : {
			total: "4509",
			ok: "8216",
			ko: "58"
		},
		standardDeviation : {
			total: "5488",
			ok: "4996",
			ko: "64"
		},
		percentiles1 : {
			total: "13890",
			ok: "14250",
			ko: "190"
		},
		percentiles2 : {
			total: "14510",
			ok: "14630",
			ko: "270"
		},
		group1 : {
			name: "t < 800 ms",
			count: 357,
			percentage: 7
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 57,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2205,
			percentage: 45
		},
		group4 : {
			name: "failed",
			count: 2181,
			percentage: 45
		},
		meanNumberOfRequestsPerSecond: {
			total: "52",
			ok: "29",
			ko: "24"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "4800",
			ok: "2373",
			ko: "2427"
		},
		minResponseTime : {
			total: "0",
			ok: "60",
			ko: "0"
		},
		maxResponseTime : {
			total: "14860",
			ok: "14860",
			ko: "390"
		},
		meanResponseTime : {
			total: "4884",
			ok: "9818",
			ko: "61"
		},
		standardDeviation : {
			total: "5717",
			ok: "4237",
			ko: "55"
		},
		percentiles1 : {
			total: "14020",
			ok: "14300",
			ko: "200"
		},
		percentiles2 : {
			total: "14570",
			ok: "14700",
			ko: "270"
		},
		group1 : {
			name: "t < 800 ms",
			count: 110,
			percentage: 2
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 70,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2193,
			percentage: 45
		},
		group4 : {
			name: "failed",
			count: 2427,
			percentage: 50
		},
		meanNumberOfRequestsPerSecond: {
			total: "52",
			ok: "26",
			ko: "27"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "4800",
			ok: "2447",
			ko: "2353"
		},
		minResponseTime : {
			total: "0",
			ok: "30",
			ko: "0"
		},
		maxResponseTime : {
			total: "14830",
			ok: "14830",
			ko: "380"
		},
		meanResponseTime : {
			total: "5156",
			ok: "10051",
			ko: "65"
		},
		standardDeviation : {
			total: "5612",
			ok: "3592",
			ko: "59"
		},
		percentiles1 : {
			total: "14010",
			ok: "14310",
			ko: "210"
		},
		percentiles2 : {
			total: "14600",
			ok: "14710",
			ko: "280"
		},
		group1 : {
			name: "t < 800 ms",
			count: 4,
			percentage: 0
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 5,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2438,
			percentage: 50
		},
		group4 : {
			name: "failed",
			count: 2353,
			percentage: 49
		},
		meanNumberOfRequestsPerSecond: {
			total: "52",
			ok: "27",
			ko: "26"
		}
	}}

function fillStats(stat){
    $("#numberOfRequests").append(stat.numberOfRequests.total);
    $("#numberOfRequestsOK").append(stat.numberOfRequests.ok);
    $("#numberOfRequestsKO").append(stat.numberOfRequests.ko);

    $("#minResponseTime").append(stat.minResponseTime.total);
    $("#minResponseTimeOK").append(stat.minResponseTime.ok);
    $("#minResponseTimeKO").append(stat.minResponseTime.ko);

    $("#maxResponseTime").append(stat.maxResponseTime.total);
    $("#maxResponseTimeOK").append(stat.maxResponseTime.ok);
    $("#maxResponseTimeKO").append(stat.maxResponseTime.ko);

    $("#meanResponseTime").append(stat.meanResponseTime.total);
    $("#meanResponseTimeOK").append(stat.meanResponseTime.ok);
    $("#meanResponseTimeKO").append(stat.meanResponseTime.ko);

    $("#standardDeviation").append(stat.standardDeviation.total);
    $("#standardDeviationOK").append(stat.standardDeviation.ok);
    $("#standardDeviationKO").append(stat.standardDeviation.ko);

    $("#percentiles1").append(stat.percentiles1.total);
    $("#percentiles1OK").append(stat.percentiles1.ok);
    $("#percentiles1KO").append(stat.percentiles1.ko);

    $("#percentiles2").append(stat.percentiles2.total);
    $("#percentiles2OK").append(stat.percentiles2.ok);
    $("#percentiles2KO").append(stat.percentiles2.ko);

    $("#meanNumberOfRequestsPerSecond").append(stat.meanNumberOfRequestsPerSecond.total);
    $("#meanNumberOfRequestsPerSecondOK").append(stat.meanNumberOfRequestsPerSecond.ok);
    $("#meanNumberOfRequestsPerSecondKO").append(stat.meanNumberOfRequestsPerSecond.ko);
}
