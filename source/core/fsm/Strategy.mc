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
    class Strategy
    {
        // Instance Attributes:
        protected const _VERTICAL_SEPERATION as Integer32 = 30;


        // Methods:
        public function draw(metrics as Array<Metric>, dc as Dc) { }
    }


    class DefaultStrategy extends Strategy
    {
        // Class Attributes:
        private const _FIRST_METRIC as Integer32 = 0;


        // Instance Attributes:
        private var _column as Column = new Column(0,0, ForerunnerXT.DISPLAY_WIDTH, ForerunnerXT.DISPLAY_HEIGHT);


        // Constructor:
        public function initialize()
        {
            Strategy.initialize();
        }


        // Methods:
        public function draw(metrics as Array<Metric>, dc as Dc)
        {
            if(metrics.size() <= 0) { return; }

            dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK);

            _column.draw(metrics, dc);
        }
    }


    class ColumnsStrategy extends Strategy
    {
        // Class Attributes:
        private const _FIRST_METRIC as Integer32 = 0;
        private const _METRICS_PER_COLUMN as Integer32 = 2;


        // Instance Attributes:
        private var topColumn as Column = new Column(0, 0, ForerunnerXT.DISPLAY_WIDTH, ForerunnerXT.DISPLAY_HEIGHT/2);
        private var bottomColumn as Column = new Column(0, ForerunnerXT.DISPLAY_HEIGHT/2, ForerunnerXT.DISPLAY_WIDTH, ForerunnerXT.DISPLAY_HEIGHT/2);

        // Constructor:
        public function initialize()
        {

        }


        // Methods:
        public function draw(metrics as Array<Metric>, dc as Dc)
        {
            if(metrics.size() <= 2) { return; }

            var first = metrics.slice(0, 2);
            var second = metrics.slice(2, metrics.size());

            topColumn.draw(first, dc);
            bottomColumn.draw(second, dc);
        }
    }
}