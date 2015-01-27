extend = require 'extend'

class Popup
  "use strict"

  # 仮
  _addEvent: do ->
    if window.addEventListener
      return (el, eventName, handler) ->
        el.addEventListener eventName, handler
    else
      return (el, eventName, handler) ->
        el.attachEvent "on#{eventName}", handler

  _removeEvent: do ->
    if window.removeEventListener
      return (el, eventName, handler) ->
        el.removeEventListener eventName, handler
    else
      return (el, eventName, handler) ->
        el.detachEvent "on#{eventName}", handler

  _defaults:
    width: 640
    height: 800
    url: null
    name: 'popup'

  setURL: ->
    if (url = @el.getAttribute('href'))?
      @_url = url
    else
      @_url = @opts.url

  setParam: ->
    if (w = @el.getAttribute('data-popup-width'))?
      width = w
    else
      width = @opts.width

    if (h = @el.getAttribute('data-popup-heigt'))?
      height = h
    else
      height = @opts.height

    x = (window.screen.width - width) / 2
    y = (window.screen.height - height) / 2

    @_param = "screenX=#{x},screenY=#{y},left=#{x},top=#{y},width=#{width},height=#{height},toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=yes"

  constructor: (@el, opts) ->
    @opts = extend {}, @_defaults, opts
    @setURL()
    @setParam()

  open: ->
    window.open @_url, @opts.name, @_param
    return this

  @open: (el) ->
    popup = new Popup el
    popup.open()

if typeof define is 'function' and define.amd
  define -> Popup
else if typeof module isnt 'undefined' and module.exports
  module.exports = Popup
else
  window.Popup or= Popup
