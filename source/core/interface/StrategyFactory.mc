import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;

module Jacobs
{
    class StrategyFactory 
    {
        // Instane Attributes:
        private var _strategies as Array<Strategy>;


        // Constructor:
        public function initialize() 
        {
            _strategies = [new DefaultStrategy(), new ColumnsStrategy()];
        }


        // Methods:
        public function getStrategy(metricsSize as Integer32) as Strategy 
        {
            if (metricsSize > _strategies.size()) 
            {
                return _strategies[1];
            } 

            return _strategies[0]; // Default strategy
        }
    }
}
