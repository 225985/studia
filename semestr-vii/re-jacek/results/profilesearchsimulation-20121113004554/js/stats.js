var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "11400",
			ok: "9843",
			ko: "1557"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "9900",
			ok: "9900",
			ko: "660"
		},
		meanResponseTime : {
			total: "4766",
			ok: "5508",
			ko: "77"
		},
		standardDeviation : {
			total: "3368",
			ok: "3017",
			ko: "132"
		},
		percentiles1 : {
			total: "9630",
			ok: "9650",
			ko: "400"
		},
		percentiles2 : {
			total: "9810",
			ok: "9810",
			ko: "610"
		},
		group1 : {
			name: "t < 800 ms",
			count: 764,
			percentage: 6
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 227,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 8852,
			percentage: 77
		},
		group4 : {
			name: "failed",
			count: 1557,
			percentage: 13
		},
		meanNumberOfRequestsPerSecond: {
			total: "131",
			ok: "113",
			ko: "18"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "3800",
			ok: "3327",
			ko: "473"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "9870",
			ok: "9870",
			ko: "660"
		},
		meanResponseTime : {
			total: "4260",
			ok: "4855",
			ko: "79"
		},
		standardDeviation : {
			total: "3348",
			ok: "3155",
			ko: "136"
		},
		percentiles1 : {
			total: "9630",
			ok: "9660",
			ko: "410"
		},
		percentiles2 : {
			total: "9800",
			ok: "9810",
			ko: "610"
		},
		group1 : {
			name: "t < 800 ms",
			count: 425,
			percentage: 11
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 84,
			percentage: 2
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2818,
			percentage: 74
		},
		group4 : {
			name: "failed",
			count: 473,
			percentage: 12
		},
		meanNumberOfRequestsPerSecond: {
			total: "44",
			ok: "38",
			ko: "5"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "3800",
			ok: "3259",
			ko: "541"
		},
		minResponseTime : {
			total: "0",
			ok: "20",
			ko: "0"
		},
		maxResponseTime : {
			total: "9890",
			ok: "9890",
			ko: "660"
		},
		meanResponseTime : {
			total: "4920",
			ok: "5725",
			ko: "73"
		},
		standardDeviation : {
			total: "3441",
			ok: "3042",
			ko: "128"
		},
		percentiles1 : {
			total: "9620",
			ok: "9640",
			ko: "390"
		},
		percentiles2 : {
			total: "9800",
			ok: "9810",
			ko: "630"
		},
		group1 : {
			name: "t < 800 ms",
			count: 234,
			percentage: 6
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 79,
			percentage: 2
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2946,
			percentage: 77
		},
		group4 : {
			name: "failed",
			count: 541,
			percentage: 14
		},
		meanNumberOfRequestsPerSecond: {
			total: "44",
			ok: "37",
			ko: "6"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "3800",
			ok: "3257",
			ko: "543"
		},
		minResponseTime : {
			total: "0",
			ok: "20",
			ko: "0"
		},
		maxResponseTime : {
			total: "9900",
			ok: "9900",
			ko: "660"
		},
		meanResponseTime : {
			total: "5118",
			ok: "5958",
			ko: "79"
		},
		standardDeviation : {
			total: "3252",
			ok: "2720",
			ko: "133"
		},
		percentiles1 : {
			total: "9630",
			ok: "9650",
			ko: "400"
		},
		percentiles2 : {
			total: "9810",
			ok: "9820",
			ko: "630"
		},
		group1 : {
			name: "t < 800 ms",
			count: 105,
			percentage: 2
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 64,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3088,
			percentage: 81
		},
		group4 : {
			name: "failed",
			count: 543,
			percentage: 14
		},
		meanNumberOfRequestsPerSecond: {
			total: "44",
			ok: "37",
			ko: "6"
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
