import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;
import Toybox.Math;

module Jacobs
{
    public enum Heuristic
    {
        FLUCTUATION = 0,
        RATE_OF_CHANGE = 1,
        RANGE = 2,
        USER_PRIORITY = 3,
        LENGTH = 4
    }

    class Metric
    {
        // Class Attributes:
        protected const _NUMBER_OF_SAMPLES as Integer32 = 4;


        // Instance Attributes:
        public var range as Range = new Range(0, 200);
        public var userPriority as Numeric32 = 1;

        private var _samples as Array<Numeric32> = new Array<Numeric32>[0];
        private var _heuristics as Array<Numeric32> = new Array<Numeric32>[0];


        // Constructor:
        public function initialize() { for(var i = 0; i < LENGTH as Integer32; i++) { _heuristics.add(0); } }


        // Methods:
        public function getCurrent(activity as Activity.Info) as Numeric32 { return 0; }

        public function getMostRecentValue() { return _samples.size() > 0 ? _samples[_samples.size()-1] : 0; }

        public function addSample(activity as Activity.Info) as Void 
        {
            // Add the new sample to the array of samples.
            _samples.add(self.getCurrent(activity));

            // If the number of samples has surpassed the limit, remove the oldest sample from the array.
            if(_samples.size() > _NUMBER_OF_SAMPLES) { _samples.remove(_samples[0]); }

            // Recalculate the heuristics.
            var minimumValue = _samples[0];
            var maximumValue = _samples[0];
            var mean = 0;
            var deviation = 0;

            // Calculate the mean.
            for(var i = 1; i < _samples.size(); i++)
            {
                mean += _samples[i];
            }

            mean = mean/_samples.size();

            // Calculate the deiviation and rate of change.
            for(var i = 1; i < _samples.size(); i++)
            {
                // Calculate the rate of change.
                if(_samples[i] > maximumValue) { maximumValue = _samples[i]; }
                else if (_samples[i] < minimumValue) { minimumValue = _samples[i]; }

                deviation += Math.pow(_samples[i] - mean, 2);
            }

            var root = (mean == 0 ? 0 : Math.sqrt(deviation/mean));

            _heuristics = [root, maximumValue-minimumValue, range.deviation(mean), userPriority];
        }

        public function getName() as String { return "DEFAULT_NAME"; }

        public function getHeuristics() as HeuristicsInfo
        {
            return new HeuristicsInfo(_heuristics[0],_heuristics[1],_heuristics[2],_heuristics[3]);
        }

        public function getHeuristicsAsArray() as Array<Numeric32>
        {
            return _heuristics;
        }

        public function getHeuristic(heuristic as Heuristic)
        {
            return _heuristics[heuristic as Integer32];
        }
    }
}