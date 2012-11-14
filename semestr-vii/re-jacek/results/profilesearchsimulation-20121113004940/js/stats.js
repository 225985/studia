var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "12600",
			ok: "9830",
			ko: "2770"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "9940",
			ok: "9940",
			ko: "3040"
		},
		meanResponseTime : {
			total: "4726",
			ok: "6044",
			ko: "47"
		},
		standardDeviation : {
			total: "3649",
			ok: "3028",
			ko: "74"
		},
		percentiles1 : {
			total: "9450",
			ok: "9630",
			ko: "110"
		},
		percentiles2 : {
			total: "9840",
			ok: "9850",
			ko: "300"
		},
		group1 : {
			name: "t < 800 ms",
			count: 657,
			percentage: 5
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 137,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 9036,
			percentage: 71
		},
		group4 : {
			name: "failed",
			count: 2770,
			percentage: 21
		},
		meanNumberOfRequestsPerSecond: {
			total: "144",
			ok: "113",
			ko: "32"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "4200",
			ok: "3375",
			ko: "825"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "9920",
			ok: "9920",
			ko: "390"
		},
		meanResponseTime : {
			total: "4326",
			ok: "5373",
			ko: "44"
		},
		standardDeviation : {
			total: "3608",
			ok: "3259",
			ko: "51"
		},
		percentiles1 : {
			total: "9460",
			ok: "9680",
			ko: "120"
		},
		percentiles2 : {
			total: "9830",
			ok: "9840",
			ko: "320"
		},
		group1 : {
			name: "t < 800 ms",
			count: 406,
			percentage: 9
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 48,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2921,
			percentage: 69
		},
		group4 : {
			name: "failed",
			count: 825,
			percentage: 19
		},
		meanNumberOfRequestsPerSecond: {
			total: "48",
			ok: "39",
			ko: "9"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "4200",
			ok: "3197",
			ko: "1003"
		},
		minResponseTime : {
			total: "0",
			ok: "20",
			ko: "0"
		},
		maxResponseTime : {
			total: "9910",
			ok: "9910",
			ko: "400"
		},
		meanResponseTime : {
			total: "4760",
			ok: "6239",
			ko: "48"
		},
		standardDeviation : {
			total: "3732",
			ok: "3023",
			ko: "49"
		},
		percentiles1 : {
			total: "9420",
			ok: "9500",
			ko: "110"
		},
		percentiles2 : {
			total: "9850",
			ok: "9850",
			ko: "320"
		},
		group1 : {
			name: "t < 800 ms",
			count: 198,
			percentage: 4
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 45,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2954,
			percentage: 70
		},
		group4 : {
			name: "failed",
			count: 1003,
			percentage: 23
		},
		meanNumberOfRequestsPerSecond: {
			total: "48",
			ok: "37",
			ko: "11"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "4200",
			ok: "3258",
			ko: "942"
		},
		minResponseTime : {
			total: "10",
			ok: "40",
			ko: "10"
		},
		maxResponseTime : {
			total: "9940",
			ok: "9940",
			ko: "3040"
		},
		meanResponseTime : {
			total: "5092",
			ok: "6550",
			ko: "49"
		},
		standardDeviation : {
			total: "3566",
			ok: "2629",
			ko: "106"
		},
		percentiles1 : {
			total: "9450",
			ok: "9700",
			ko: "100"
		},
		percentiles2 : {
			total: "9840",
			ok: "9850",
			ko: "280"
		},
		group1 : {
			name: "t < 800 ms",
			count: 53,
			percentage: 1
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 44,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3161,
			percentage: 75
		},
		group4 : {
			name: "failed",
			count: 942,
			percentage: 22
		},
		meanNumberOfRequestsPerSecond: {
			total: "48",
			ok: "37",
			ko: "11"
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
