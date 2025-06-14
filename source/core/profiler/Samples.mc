import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

module Jacobs
{
    class Metrics
    {
        // ClassAttributes:
        private const _cadenceSamples = [162,178,160,154,180,180,179,179,180,181,180];
        private const _paceSamples = [5.0,5.0,5.0,5.0,5.0,5.0,5.0,5.0,5.0,5.0];
        private const _heartRateSamples = [160,160,162,160,168,174,176,172,168,166,166];


        // Methods:
        public function getInfo(step as Integer32) as Activity.Info
        {
            var activity = new Activity.Info();
            activity.currentCadence = _cadenceSamples[step];
            activity.currentSpeed = _paceSamples[step];
            activity.currentHeartRate = _heartRateSamples[step];

            return activity;
        }
    }
}