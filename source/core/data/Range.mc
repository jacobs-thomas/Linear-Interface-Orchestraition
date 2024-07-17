import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

module Jacobs
{
    class Range
    {
        /**
        * The Range class represents a numerical range with a minimum and maximum boundary.
        * The class provides methods to set and get these boundaries, which ensure the
        * boundaries maintain the correct orientation.
        */


        // Instance Attributes:
        private var _minimum as Numeric32 = 0;
        private var _maximum as Numeric32 = 0;

        
        // Constructor:
        public function initialize(minimum as Numeric32, maximum as Numeric32)
        {
            /**
            * Constructs the Range with specified minimum and maximum values.
            * Ensures that the minimum is less than or equal to the maximum.
            *
            * @param minimum The minimum value of the range.
            * @param maximum The maximum value of the range.
            */


            self.setMaximum(maximum);
            self.setMinimum(minimum);
        }


        // Methods:
        public function setMinimum(minimum as Numeric32) as Void
        {
            /**
            * Sets the minimum value of the range.
            * If the provided minimum is greater than the current maximum,
            * the values are swapped to maintain a valid range.
            *
            * @param minimum The new minimum value of the range.
            * @return Void
            */


            if(minimum > _maximum) 
            {
                // In the event the new paramatrised minimum is larger than the maximum, swap the values.
                _minimum = _maximum;
                _maximum = minimum;
            }

            _minimum = minimum;
        }

        public function setMaximum(maximum as Numeric32) as Void
        {
            /**
            * Sets the maximum value of the range.
            * If the provided maximum is less than the current minimum,
            * the values are swapped to maintain a valid range.
            *
            * @param maximum The new maximum value of the range.
            * @return Void
            */

            if(maximum < _minimum) 
            {
                // In the event the new paramatrised maximum is smaller than the minimum, swap the values.
                _maximum = _minimum;
                _minimum = maximum;
                return;
            }

            _maximum = maximum;
        }

        public function getMinimum() as Numeric32 
        { 
            /**
            * Gets the minimum value of the range.
            *
            * @return The minimum value of the range.
            */


            return _minimum; 
        }

        public function getMaximum() as Numeric32 
        {
            /**
            * Gets the maximum value of the range.
            *
            * @return The maximum value of the range.
            */


            return _maximum;  
        }

        public function isInRange(value as Numeric32) as Boolean
        {
            /**
            * Checks if a value is within the range.
            *
            * @param value The value to check.
            * @return Boolean True if the value is within the range, false otherwise.
            */


            return value <= _maximum && value >= _minimum;
        }

        public function deviation(value as Numeric32) as Numeric32
        {
            /**
            * Calculates the absolute deviation of a value from the nearest range boundary.
            * If the value is within the range, the deviation is zero.
            *
            * @param value The value to calculate the deviation for.
            * @return Numeric32 The absolute deviation from the nearest range boundary.
            */


            if(self.isInRange(value)) { return 0; }

            return value > _maximum ? value - _maximum : _minimum - value;
        }
    }
}