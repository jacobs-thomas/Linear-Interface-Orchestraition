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
    class LayoutOrchestrator
    {
        /**
        * This class orchestrates the layout of the display based on the number of messages.
        * It manages different layout states and transitions between them.
        */


        // Instance Attributes:
        private var _strategyFactory as StrategyFactory = new StrategyFactory();


        // Constructor:
        public function initialize() { }


        // Methods:
        public function draw(metrics as Array<Metric>, dc as Dc) as Void 
        {
            /**
            * Draws the display based on the current state and number of messages.
            * 
            * @param messages An array of Message objects to be displayed.
            * @param dc       The device context used for drawing.
            * @return Void
            */


            // Clear the current frame.
            dc.clear();

            // Set the colour.
            dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK);

            // Draw using the appopriate layout for the number of metrics to display.
            _strategyFactory.getStrategy(metrics.size()).draw(metrics, dc);
        }
    }
}

