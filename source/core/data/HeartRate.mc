import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;
import Toybox.Math;

module Jacobs
{
    class HeartRate extends Metric
    {
        // Constructor:
        public function initialize()
        {
            Metric.initialize();
        }


        // Methods:
        public function getCurrent(activity as Activity.Info) as Numeric32
        {
            return activity.currentHeartRate== null ? 0 : activity.currentHeartRate;
        }

        public function getName() as String { return "HeartRate"; }
    }
}