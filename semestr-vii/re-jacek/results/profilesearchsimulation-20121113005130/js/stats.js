var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "13200",
			ok: "6225",
			ko: "6975"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "27170",
			ok: "27170",
			ko: "7680"
		},
		meanResponseTime : {
			total: "5762",
			ok: "11779",
			ko: "392"
		},
		standardDeviation : {
			total: "7194",
			ok: "6391",
			ko: "581"
		},
		percentiles1 : {
			total: "20940",
			ok: "23440",
			ko: "910"
		},
		percentiles2 : {
			total: "24560",
			ok: "25070",
			ko: "3540"
		},
		group1 : {
			name: "t < 800 ms",
			count: 405,
			percentage: 3
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 56,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 5764,
			percentage: 43
		},
		group4 : {
			name: "failed",
			count: 6975,
			percentage: 52
		},
		meanNumberOfRequestsPerSecond: {
			total: "138",
			ok: "65",
			ko: "73"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "4400",
			ok: "2328",
			ko: "2072"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "26200",
			ok: "26200",
			ko: "6380"
		},
		meanResponseTime : {
			total: "5961",
			ok: "10898",
			ko: "413"
		},
		standardDeviation : {
			total: "7456",
			ok: "7276",
			ko: "632"
		},
		percentiles1 : {
			total: "21200",
			ok: "23670",
			ko: "940"
		},
		percentiles2 : {
			total: "24820",
			ok: "25080",
			ko: "3610"
		},
		group1 : {
			name: "t < 800 ms",
			count: 315,
			percentage: 7
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 27,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 1986,
			percentage: 45
		},
		group4 : {
			name: "failed",
			count: 2072,
			percentage: 47
		},
		meanNumberOfRequestsPerSecond: {
			total: "46",
			ok: "24",
			ko: "22"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "4400",
			ok: "1896",
			ko: "2504"
		},
		minResponseTime : {
			total: "0",
			ok: "30",
			ko: "0"
		},
		maxResponseTime : {
			total: "27170",
			ok: "27170",
			ko: "7600"
		},
		meanResponseTime : {
			total: "5647",
			ok: "12573",
			ko: "402"
		},
		standardDeviation : {
			total: "7300",
			ok: "6243",
			ko: "554"
		},
		percentiles1 : {
			total: "21090",
			ok: "23650",
			ko: "910"
		},
		percentiles2 : {
			total: "24760",
			ok: "25140",
			ko: "3530"
		},
		group1 : {
			name: "t < 800 ms",
			count: 87,
			percentage: 1
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 29,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 1780,
			percentage: 40
		},
		group4 : {
			name: "failed",
			count: 2504,
			percentage: 56
		},
		meanNumberOfRequestsPerSecond: {
			total: "46",
			ok: "20",
			ko: "26"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "4400",
			ok: "2001",
			ko: "2399"
		},
		minResponseTime : {
			total: "0",
			ok: "70",
			ko: "0"
		},
		maxResponseTime : {
			total: "26160",
			ok: "26160",
			ko: "7680"
		},
		meanResponseTime : {
			total: "5679",
			ok: "12051",
			ko: "364"
		},
		standardDeviation : {
			total: "6806",
			ok: "5196",
			ko: "561"
		},
		percentiles1 : {
			total: "19390",
			ok: "21990",
			ko: "900"
		},
		percentiles2 : {
			total: "24040",
			ok: "24550",
			ko: "3430"
		},
		group1 : {
			name: "t < 800 ms",
			count: 3,
			percentage: 0
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 0,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 1998,
			percentage: 45
		},
		group4 : {
			name: "failed",
			count: 2399,
			percentage: 54
		},
		meanNumberOfRequestsPerSecond: {
			total: "46",
			ok: "21",
			ko: "25"
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
