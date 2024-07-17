import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;


module ForerunnerXT
{
    public const DISPLAY_WIDTH as Lang.Number = 205;
    public const DISPLAY_HEIGHT as Lang.Number = 148;
    public const SEGEMENTS_PER_ROW as Lang.Number = 2;
    public const SEGMENT_WIDTH as Lang.Number = DISPLAY_WIDTH / SEGEMENTS_PER_ROW;
    public const SEGMENT_HEIGHT as Lang.Number = DISPLAY_HEIGHT / SEGEMENTS_PER_ROW;
}


module Jacobs
{
    enum LayoutStateEnum
    {
        ZERO_MESSAGES,
        ONE_MESSAGE,
        TWO_MESSAGES,
        THREE_MESSAGES,
        FOUR_MESSAGES
    }

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
                dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK);
                dc.drawText((_width/metrics.size()) * i, dc.getHeight()/2 - _VERTICAL_SEPERATION/2, Graphics.FONT_LARGE, metrics[i].getName(), Graphics.TEXT_JUSTIFY_CENTER);
                dc.drawText((_width/metrics.size()) * i, dc.getHeight()/2 + _VERTICAL_SEPERATION/2, Graphics.FONT_LARGE, metrics[i].getMostRecentValue().format("%i"), Graphics.TEXT_JUSTIFY_CENTER);
            }
        }
    }

    enum StrategyOrder
    {
        DEFAULT = 0,
        COLUMNS = 1,
        NUMBER_OF_STRATEGIES = 2
    }

    class LayoutOrchestrator
    {
        /**
        * This class orchestrates the layout of the display based on the number of messages.
        * It manages different layout states and transitions between them.
        */


        // Instance Attributes:
        private var _defaultStrategy as Strategy = new DefaultStrategy();
        private var _columnsStrategy as Strategy = new ColumnsStrategy();


        // Constructor:
        public function initialize() 
        {
            //_states.add(new OneMessageState());
           // _states.add(new TwoMessagesState());
            //_states.add(new ThreeMessagesState());
            //_states.add(new FourMessagesState());

        }


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


            _defaultStrategy.draw(metrics, dc);

            // if(metrics.size() < 2) { _defaultStrategy.draw(metrics, dc); }
            // else { _columnsStrategy.draw(metrics, dc); }


            // Render the current metrics.
            //_states[metrics.size() > 4 ? 4 : metrics.size()].draw(dc, metrics, self);
        }
    }
}

