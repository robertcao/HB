$(function() {

    Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2017 Q1',
            incubation: 546,
            seed: 1646,
            pre_a: 1222,
            series_a: 647,
            series_b: 632
        }, {
            period: '2017 Q2',
            incubation: 1366,
            seed: 2666,
            pre_a: 2222,
            series_a: 1167,
            series_b: 721
        }, {
            period: '2017 Q3',
            incubation: 1626,
            seed: 2466,
            pre_a: 2622,
            series_a: 1647,
            series_b: 1321
        }, {
            period: '2017 Q4',
            incubation: 1866,
            seed: 2434,
            pre_a: 2422,
            series_a: 1984,
            series_b: 2721
        }, {
            period: '2018 Q1',
            incubation: 1946,
            seed: 2826,
            pre_a: 2822,
            series_a: 2427,
            series_b: 3821
        }, {
            period: '2018 Q2',
            incubation: 2456,
            seed: 3666,
            pre_a: 3222,
            series_a: 3647,
            series_b: 4921
        }],
        xkey: 'period',
        ykeys: ['incubation', 'seed', 'pre_a', 'series_a', 'series_b'],
        labels: ['Incubation', 'Seed', 'Pre-A', 'Series-A', 'Series-B'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Lead",
            value: 12
        }, {
            label: "Engaged",
            value: 17
        }, {
            label: "DD",
            value: 35
        }, {
            label: "TS",
            value: 23
        }, {
            label: "Invested",
            value: 32
        }, {
            label: "Track",
            value: 25
        }, {
            label: "Passed",
            value: 9
        }, {
            label: "China",
            value: 25
        }],
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '2017-11',
            a: 15,
            b: 12
        }, {
            y: '2017-12',
            a: 10,
            b: 9
        }, {
            y: '2018-01',
            a: 20,
            b: 18
        }, {
            y: '2018-02',
            a: 25,
            b: 19
        }, {
            y: '2018-03',
            a: 32,
            b: 20
        }, {
            y: '2018-04',
            a: 38,
            b: 22
        }, {
            y: '2018-05',
            a: 27,
            b: 25
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Total', 'Yours'],
        barColors: ['#26BFAF', '#177878'],
        hideHover: 'auto',
        resize: true
    });
    
});
