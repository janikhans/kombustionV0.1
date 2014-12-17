$(function() {

    Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2010 Q1',
            YZ250FX: 2666,
            F800GSA: null,
            CRF250R: 2647
        }, {
            period: '2010 Q2',
            YZ250FX: 2778,
            F800GSA: 2294,
            CRF250R: 2441
        }, {
            period: '2010 Q3',
            YZ250FX: 4912,
            F800GSA: 1969,
            CRF250R: 2501
        }, {
            period: '2010 Q4',
            YZ250FX: 3767,
            F800GSA: 3597,
            CRF250R: 5689
        }, {
            period: '2011 Q1',
            YZ250FX: 6810,
            F800GSA: 1914,
            CRF250R: 2293
        }, {
            period: '2011 Q2',
            YZ250FX: 5670,
            F800GSA: 4293,
            CRF250R: 1881
        }, {
            period: '2011 Q3',
            YZ250FX: 4820,
            F800GSA: 3795,
            CRF250R: 1588
        }, {
            period: '2011 Q4',
            YZ250FX: 15073,
            F800GSA: 5967,
            CRF250R: 5175
        }, {
            period: '2012 Q1',
            YZ250FX: 10687,
            F800GSA: 4460,
            CRF250R: 2028
        }, {
            period: '2012 Q2',
            YZ250FX: 8432,
            F800GSA: 5713,
            CRF250R: 1791
        }],
        xkey: 'period',
        ykeys: ['YZ250FX', 'F800GSA', 'CRF250R'],
        labels: ['YZ250FX', 'F800GSA', 'CRF250R'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Download Sales",
            value: 12
        }, {
            label: "In-Store Sales",
            value: 30
        }, {
            label: "Mail-Order Sales",
            value: 20
        }],
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '2006',
            a: 100,
            b: 90
        }, {
            y: '2007',
            a: 75,
            b: 65
        }, {
            y: '2008',
            a: 50,
            b: 40
        }, {
            y: '2009',
            a: 75,
            b: 65
        }, {
            y: '2010',
            a: 50,
            b: 40
        }, {
            y: '2011',
            a: 75,
            b: 65
        }, {
            y: '2012',
            a: 100,
            b: 90
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        hideHover: 'auto',
        resize: true
    });

});
