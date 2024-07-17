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
        class Layout
    {
        // Methods:
        protected var _x as Integer32 = 0;
        protected var _y as Integer32 = 0;
        protected var _width as Integer32 = 0;
        protected var _height as Integer32 = 0;


        // Constructor:
        public function initialize(x as Integer32, y as Integer32, width as Integer32, height as Integer32)
        {
            _x = x;
            _y = y;
            _width = width;
            _height = height;
        }


        // Methods:
        public function draw(metrics as Array<Metric>, dc as Dc)
        {

        }
    }

    class Column extends Layout
    {
        private const _VERTICAL_SEPERATION as Integer32 = 30;


        public function initialize(x as Integer32, y as Integer32, width as Integer32, height as Integer32)
        {
            Layout.initialize(x,y,width,height);
        }

        // Methods:
        public function draw(metrics as Array<Metric>, dc as Dc)
        {

            for (var i = 0; i < metrics.size(); i++) 
            {
                dc.drawText((_width/metrics.size()) * i, dc.getHeight()/2 - _VERTICAL_SEPERATION/2, Graphics.FONT_LARGE, metrics[i].getName(), Graphics.TEXT_JUSTIFY_CENTER);
                dc.drawText((_width/metrics.size()) * i, dc.getHeight()/2 + _VERTICAL_SEPERATION/2, Graphics.FONT_LARGE, metrics[i].getMostRecentValue().format("%i"), Graphics.TEXT_JUSTIFY_CENTER);
            }
        }
    }
}