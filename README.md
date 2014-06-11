# Serving an API from Rails

## Goal

To help students learn how to create a test driven Rails applications that serve an API.
This API will begin serving JSON and can be extended easily to serve XML.

The format of the JSON responses will be a form called [HAL](http://stateless.co/hal_specification.html)
which is one way to create a hypermedia API. Completely understanding HAL is 
not a goal. Decisions like this will typically be made by a senior engineer
and you will typically be asked to understand the structure and be able 
to implement it.

## Setup

To get started, please follow these instructions:
* Fork and clone
* Bundle 
* Create and migrate your database
* Run rspec to make sure that everything is working

## Assignment

* Create a Tracker project called `serving-api-<team names>`
* Import stories from `tracker_stories`

Getting to the MVP marker will expose students to the basics of serving
an API from Rails. If you have the time and the desire, the two extra
stories will dig deeper into serving APIs from Rails.