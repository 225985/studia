var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "8400",
			ok: "8397",
			ko: "3"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "60020",
			ok: "3820",
			ko: "60020"
		},
		meanResponseTime : {
			total: "1846",
			ok: "1832",
			ko: "40010"
		},
		standardDeviation : {
			total: "1028",
			ok: "1129",
			ko: "0"
		},
		percentiles1 : {
			total: "3550",
			ok: "3550",
			ko: "60020"
		},
		percentiles2 : {
			total: "3760",
			ok: "3760",
			ko: "60020"
		},
		group1 : {
			name: "t < 800 ms",
			count: 1897,
			percentage: 22
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 1035,
			percentage: 12
		},
		group3 : {
			name: "t > 1200 ms",
			count: 5465,
			percentage: 65
		},
		group4 : {
			name: "failed",
			count: 3,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "103",
			ok: "103",
			ko: "0"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "2800",
			ok: "2798",
			ko: "2"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "60010",
			ok: "3810",
			ko: "60010"
		},
		meanResponseTime : {
			total: "1682",
			ok: "1661",
			ko: "30005"
		},
		standardDeviation : {
			total: "980",
			ok: "1132",
			ko: "0"
		},
		percentiles1 : {
			total: "3330",
			ok: "3330",
			ko: "60010"
		},
		percentiles2 : {
			total: "3740",
			ok: "3730",
			ko: "60010"
		},
		group1 : {
			name: "t < 800 ms",
			count: 772,
			percentage: 27
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 361,
			percentage: 12
		},
		group3 : {
			name: "t > 1200 ms",
			count: 1665,
			percentage: 59
		},
		group4 : {
			name: "failed",
			count: 2,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "34",
			ok: "34",
			ko: "0"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "2800",
			ok: "2799",
			ko: "1"
		},
		minResponseTime : {
			total: "20",
			ok: "20",
			ko: "60020"
		},
		maxResponseTime : {
			total: "60020",
			ok: "3810",
			ko: "60020"
		},
		meanResponseTime : {
			total: "1926",
			ok: "1905",
			ko: "60020"
		},
		standardDeviation : {
			total: "994",
			ok: "1147",
			ko: "0"
		},
		percentiles1 : {
			total: "3600",
			ok: "3590",
			ko: "60020"
		},
		percentiles2 : {
			total: "3760",
			ok: "3760",
			ko: "60020"
		},
		group1 : {
			name: "t < 800 ms",
			count: 600,
			percentage: 21
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 329,
			percentage: 11
		},
		group3 : {
			name: "t > 1200 ms",
			count: 1870,
			percentage: 66
		},
		group4 : {
			name: "failed",
			count: 1,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "34",
			ok: "34",
			ko: "0"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "2800",
			ok: "2800",
			ko: "0"
		},
		minResponseTime : {
			total: "40",
			ok: "40",
			ko: "-"
		},
		maxResponseTime : {
			total: "3820",
			ok: "3820",
			ko: "-"
		},
		meanResponseTime : {
			total: "1930",
			ok: "1930",
			ko: "-"
		},
		standardDeviation : {
			total: "1087",
			ok: "1087",
			ko: "-"
		},
		percentiles1 : {
			total: "3620",
			ok: "3620",
			ko: "-"
		},
		percentiles2 : {
			total: "3770",
			ok: "3770",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 525,
			percentage: 18
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 345,
			percentage: 12
		},
		group3 : {
			name: "t > 1200 ms",
			count: 1930,
			percentage: 68
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "34",
			ok: "34",
			ko: "-"
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
