import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;
import Toybox.Math;

module Jacobs
{
    
    class HeuristicsInfo
    {
        // Class Attributes:
        public const NUMBER_OF_HEURISTICS as Integer32 = 4;

        
        // Instance Attributes:
        public var _heuristics as Array<Numeric32>;


        // Constructor:
        public function initialize(fluctuation as Numeric32, rateOfChange as Numeric32, range as Numeric32, userPriority as Numeric32)
        {
            _heuristics = new Array<Numeric32>[NUMBER_OF_HEURISTICS];

            _heuristics[FLUCTUATION] = fluctuation;
            _heuristics[RATE_OF_CHANGE] = rateOfChange;
            _heuristics[RANGE] = range;
            _heuristics[USER_PRIORITY] = userPriority;
        }

        
        // Methods:
        public function toArray() as Array<Numeric32> { return _heuristics; } 

        public function getFluctation() as Numeric32 { return _heuristics[FLUCTUATION]; }
        public function getRateOfChange() as Numeric32 { return _heuristics[RATE_OF_CHANGE]; }
        public function getRange() as Numeric32 { return _heuristics[RANGE]; }
        public function getUserPriority() as Numeric32 { return _heuristics[USER_PRIORITY]; }
        public function getLinearPrioritisation() as Numeric32
        {
            return (_heuristics[FLUCTUATION] + _heuristics[RATE_OF_CHANGE] + _heuristics[RANGE]) * _heuristics[USER_PRIORITY];
        }
        public function getHeuristic(heuristic as Heuristic or Integer32)
        {
            Test.assert(heuristic as Integer32 < _heuristics.size());

            return _heuristics[heuristic as Integer32];
        }
    }
}