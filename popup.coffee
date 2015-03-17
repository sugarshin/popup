###!
 * @license popup
 * (c) sugarshin
 * License: MIT
###

"use strict"

do (root = this, factory = ->

  class Popup

    addEvent = do ->
      if window.addEventListener
        (el, eventName, handler, useCapture = false) ->
          el.addEventListener eventName, handler, useCapture
      else
        (el, eventName, handler) ->
          el.attachEvent "on#{eventName}", -> handler.call el

    removeEvent = do ->
      if window.removeEventListener
        (el, eventName, handler, useCapture = false) ->
          el.removeEventListener eventName, handler, useCapture
      else
        (el, eventName, handler) ->
          el.detachEvent "on#{eventName}", handler



    _defaults:
      width: 640
      height: 800
      url: null
      nameSuffix: '-popup'

    setURL: ->
      if (url = @el.getAttribute('href'))?
        @_url = url
      else
        @_url = @opts.url

    setName: ->　@_name = "#{window.name}#{@opts.nameSuffix}"

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

    _configure: (opts) ->
      @opts = opts or {}
      @opts.width = @opts.width or @_defaults.width
      @opts.height = @opts.height or @_defaults.height
      @opts.url = @opts.url or @_defaults.url
      @opts.nameSuffix = @opts.nameSuffix or @_defaults.nameSuffix

    constructor: (@el, opts) ->
      @_configure opts
      @setURL()
      @setName()
      @setParam()
      @events()

    open: ->
      window.open @_url, @opts.name, @_param
      return this

    events: ->
      addEvent @el, 'click', (ev) =>
        ev.preventDefault?()
        @open()

    @open: (el) ->
      unless el? then return
      new Popup(el).open()

) ->
  if typeof module is 'object' and typeof module.exports is 'object'
    module.exports = factory()
  else
    root.Popup or= factory()
  return
