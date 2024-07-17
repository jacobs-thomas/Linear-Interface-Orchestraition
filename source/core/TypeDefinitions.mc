import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

module Jacobs
{
    typedef Numeric32 as Number or Float or Long or Double;
    typedef Float32 as Float;
    typedef Integer32 as Number;
}

module ForerunnerXT
{
    public const DISPLAY_WIDTH as Lang.Number = 205;
    public const DISPLAY_HEIGHT as Lang.Number = 148;
    public const SEGEMENTS_PER_ROW as Lang.Number = 2;
    public const SEGMENT_WIDTH as Lang.Number = DISPLAY_WIDTH / SEGEMENTS_PER_ROW;
    public const SEGMENT_HEIGHT as Lang.Number = DISPLAY_HEIGHT / SEGEMENTS_PER_ROW;
}
