import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Jacobs;

class LinearApplicationView extends WatchUi.WatchFace 
{
    // Class Attributes:
    private const _TOLERANCE as Float = 1.0;


    // Instance Attributes:
    private var layoutOrchestrator as LayoutOrchestrator = new LayoutOrchestrator();
    private var _metrics = [new Cadence(), new Pace(), new HeartRate()];
    private var i = 0;


    // Constructor:
    function initialize() 
    {
        WatchFace.initialize();

        // Cadence:
        _metrics[0].range.setMinimum(170);
        _metrics[0].range.setMaximum(180);
        _metrics[0].userPriority = 0.2;

        // Pace:
        _metrics[1].range.setMinimum(5);
        _metrics[1].range.setMaximum(5.3);
        _metrics[1].userPriority = 0.2;

        // Heart Rate:
        _metrics[2].range.setMinimum(160);
        _metrics[2].range.setMaximum(170);
        _metrics[2].userPriority = 0.4;
    }


    // Methods:
    function onLayout(dc as Dc) as Void 
    {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onUpdate(dc as Dc) as Void 
    {
        // Update and clear the previous view frame.
        View.onUpdate(dc);

        // Cache these variables to optimise their frequent use.
        var activity = Activity.getActivityInfo();
        var queue = new MetricQueue();
        var result = [];
        var maximumPriority = 0;
        var priority = 0;
        var heuristics = [];
        var test = new Metrics();
        activity = test.getInfo(i);
        i+=1;

        // Collect and prioritise metrics
        for (var i = 0; i < _metrics.size(); i++)
        {
            // Add a new sample using the latest activity info.
            _metrics[i].addSample(activity);


            heuristics = _metrics[i].getHeuristicsAsArray();
            priority = (heuristics[0] + heuristics[1] + heuristics[2]) * heuristics[3];

            queue.enqueue(_metrics[i], priority);

            if(maximumPriority < priority) { maximumPriority = priority; }
        }

        // Filter metrics based on the tolerance threshold
        var item = null;

        while (!queue.isEmpty())
        {
            item = queue.dequeue();

            if(maximumPriority - item.priority < _TOLERANCE)
            {
                result.add(item.metric);
            }
        }

        // Draw filtered metrics
        layoutOrchestrator.draw(result, dc);
    }
}
