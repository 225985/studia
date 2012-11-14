var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "13800",
			ok: "7939",
			ko: "5861"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "14400",
			ok: "14400",
			ko: "620"
		},
		meanResponseTime : {
			total: "5071",
			ok: "8749",
			ko: "88"
		},
		standardDeviation : {
			total: "5343",
			ok: "4215",
			ko: "125"
		},
		percentiles1 : {
			total: "13460",
			ok: "13580",
			ko: "430"
		},
		percentiles2 : {
			total: "13900",
			ok: "14060",
			ko: "520"
		},
		group1 : {
			name: "t < 800 ms",
			count: 567,
			percentage: 4
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 74,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 7298,
			percentage: 52
		},
		group4 : {
			name: "failed",
			count: 5861,
			percentage: 42
		},
		meanNumberOfRequestsPerSecond: {
			total: "149",
			ok: "86",
			ko: "63"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "4600",
			ok: "2825",
			ko: "1775"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "14290",
			ok: "14290",
			ko: "620"
		},
		meanResponseTime : {
			total: "4772",
			ok: "7716",
			ko: "87"
		},
		standardDeviation : {
			total: "5232",
			ok: "4701",
			ko: "125"
		},
		percentiles1 : {
			total: "13450",
			ok: "13580",
			ko: "430"
		},
		percentiles2 : {
			total: "13890",
			ok: "14040",
			ko: "530"
		},
		group1 : {
			name: "t < 800 ms",
			count: 396,
			percentage: 8
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 29,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2400,
			percentage: 52
		},
		group4 : {
			name: "failed",
			count: 1775,
			percentage: 38
		},
		meanNumberOfRequestsPerSecond: {
			total: "50",
			ok: "31",
			ko: "19"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "4600",
			ok: "2608",
			ko: "1992"
		},
		minResponseTime : {
			total: "0",
			ok: "30",
			ko: "0"
		},
		maxResponseTime : {
			total: "14400",
			ok: "14400",
			ko: "620"
		},
		meanResponseTime : {
			total: "5272",
			ok: "9230",
			ko: "89"
		},
		standardDeviation : {
			total: "5461",
			ok: "4051",
			ko: "125"
		},
		percentiles1 : {
			total: "13480",
			ok: "13620",
			ko: "430"
		},
		percentiles2 : {
			total: "13900",
			ok: "14090",
			ko: "530"
		},
		group1 : {
			name: "t < 800 ms",
			count: 163,
			percentage: 3
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 24,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2421,
			percentage: 52
		},
		group4 : {
			name: "failed",
			count: 1992,
			percentage: 43
		},
		meanNumberOfRequestsPerSecond: {
			total: "50",
			ok: "28",
			ko: "22"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "4600",
			ok: "2506",
			ko: "2094"
		},
		minResponseTime : {
			total: "0",
			ok: "30",
			ko: "0"
		},
		maxResponseTime : {
			total: "14290",
			ok: "14290",
			ko: "590"
		},
		meanResponseTime : {
			total: "5168",
			ok: "9413",
			ko: "88"
		},
		standardDeviation : {
			total: "5323",
			ok: "3522",
			ko: "123"
		},
		percentiles1 : {
			total: "13450",
			ok: "13570",
			ko: "430"
		},
		percentiles2 : {
			total: "13890",
			ok: "14050",
			ko: "510"
		},
		group1 : {
			name: "t < 800 ms",
			count: 8,
			percentage: 0
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 21,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2477,
			percentage: 53
		},
		group4 : {
			name: "failed",
			count: 2094,
			percentage: 45
		},
		meanNumberOfRequestsPerSecond: {
			total: "50",
			ok: "27",
			ko: "23"
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
