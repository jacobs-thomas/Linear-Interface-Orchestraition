import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;
using Toybox.Test;

module Jacobs
{
    class MetricQueue
    {
        // Structures:
        class Item
        {
            // Instance Attributes:
            public var metric as Metric or Null = null;
            public var priority as Float32 = 0.0;

            // Constructor:
            public function initialize(metric as Metric, priority as Float32)
            {
                self.metric = metric;
                self.priority = priority;
            }
        }


        // Class Attributes:
        private const _STARTING_INDEX as Integer32 = 0;


        // Instance Attributes:
        private var _elements as Array<Item>;


        // Constructor:
        public function initialize()
        {
            _elements = [];
        }


        // Methods:
        public function isEmpty() as Boolean
        {
            return _elements.size() <= 0;
        }

        public function enqueue(value, priority as Float32) as Void
        {
            /**
            *   Adds an element to the priority queue at the correct position based on its priority.
            *   @param element The element to be added to the priority queue.
            */


            var position = findInsertPosition(priority);
            insertAtPosition(new Item(value, priority), position);
        }

        public function dequeue() as Item or Null
        {
            /**
            *   Removes and returns the element with the highest priority from the queue.
            *   @return The element with the highest priority, or null if the queue is empty.
            */


            if (_elements.size() == 0) 
            {
                // If the queue is empty then return null.
                return null;
            }

            // Copy and remove the element with the highest priority from the queue.
            var object = _elements[_STARTING_INDEX];
            _elements.remove(_elements[_STARTING_INDEX]);

            return object;
        }

        private function findInsertPosition(priority as Float32) as Integer32
        {
            /**
            *   Finds the correct position to insert a new item in the queue based on its priority.
            *   @param item The item to be inserted.
            *   @return The index at which the item should be inserted.
            */


            var low = 0;
            var high = _elements.size() - 1;

            while (low <= high) 
            {
                var mid = (low + high) / 2;
                
                if (_elements[mid].priority < priority)
                {
                    high = mid - 1;
                } 

                else 
                {
                    low = mid + 1;
                }
            }

            return low;
        }

        private function insertAtPosition(item as Item, position as Integer32)  as Void
        {
            /** 
            *   Inserts an item at the specified position in the queue.
            *   @param item The item to be inserted.
            *   @param position The index at which the item should be inserted.
            */


            var newElements = new Array<Item>[0];

            for (var i = 0; i < position; i++) 
            {
                newElements.add(_elements[i]);
            }

            newElements.add(item);

            for (var i = position; i < _elements.size(); i++) 
            {
                newElements.add(_elements[i]);
            }

            _elements = newElements;
        }
    }
}